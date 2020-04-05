//
//  PolarLayoutCoordinator.swift
//
//  Created by Adam Fordyce on 03/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

private struct PolarLayoutCoordinator: LayoutCoordinator {

    let baseOrigin: CGPoint
    let baseRect: CGRect
    private let radiusCalculator: RadiusForRingCalculator
    private let angleCalculator: AngleForSegmentCalculator
    
    @_optimize(none) init(origin: CGPoint, rect: CGRect, radiusCalculator: RadiusForRingCalculator, angleCalculator: AngleForSegmentCalculator) {
        self.baseOrigin = origin
        self.baseRect = rect
        self.radiusCalculator = radiusCalculator
        self.angleCalculator = angleCalculator
    }
    
    subscript(ringIndex: Int, segmentIndex: Int) -> CGPoint {
        baseOrigin.offset(
            radius: radiusCalculator.radiusFor(ringIndex: ringIndex),
            angle: angleCalculator.angleFor(segmentIndex: segmentIndex))
    }
    
    var xCount: Int {
        radiusCalculator.ringCount
    }
    
    var yCount: Int {
        angleCalculator.segmentCount
    }
    
    @_optimize(none) func reframed(into rect: CGRect, originalRect: CGRect, origin: UnitPoint? = nil) -> LayoutCoordinator {
        let newOrigin = calcOrigin(in: rect, origin: origin ?? .center)
        let size: CGSize = .square(radiusCalculator.useMaxDimension ? rect.maxDimension : rect.minDimension)
        
        return PolarLayoutCoordinator(
            origin: newOrigin,
            rect: CGRect(newOrigin.offset(in: size, anchor: .center), size),
            radiusCalculator: radiusCalculator.reframed(rect),
            angleCalculator: angleCalculator.reframed(rect))
    }
    
    @_optimize(none) func anchorLocation(for anchor: UnitPoint, size: CGSize) -> CGPoint {
        
        if anchor == .center {
            return baseOrigin
        } else {
            let virtualRectOrigin = baseOrigin - baseRect.sizeScaled(0.5).asCGPoint
            return virtualRectOrigin.moveOrigin(in: baseRect.size, origin: anchor)
        }
    }
}

private extension PolarLayoutCoordinator {
    
    var topLeading: CGPoint {
        baseRect.topLeading
    }
    
    var top: CGPoint {
        baseRect.top
    }
    
    var topTrailing: CGPoint {
        baseRect.topTrailing
    }
    
    var trailing: CGPoint {
        baseRect.trailing
    }
    
    var bottomTrailing: CGPoint {
        baseRect.bottomTrailing
    }
    
    var bottom: CGPoint {
        baseRect.bottom
    }
    
    var bottomLeading: CGPoint {
        baseRect.bottomLeading
    }
    
    var leading: CGPoint {
        baseRect.leading
    }
    
    var center: CGPoint {
        baseRect.center
    }
}

// MARK: ----- POLAR CALCULATOR PROTOCOLS

private protocol RadiusForRingCalculator {
    
    var useMaxDimension: Bool {get}
    var ringCount: Int {get}
    @_optimize(none) func radiusFor(ringIndex: Int) -> CGFloat
    @_optimize(none) func reframed(_ rect: CGRect) -> RadiusForRingCalculator
}

private protocol AngleForSegmentCalculator {
    
    var segmentCount: Int {get}
    @_optimize(none) func angleFor(segmentIndex: Int) -> Angle
    @_optimize(none) func reframed(_ rect: CGRect) -> AngleForSegmentCalculator
}

private struct EquidistantRadiusForRingCalculator: RadiusForRingCalculator {

    private typealias Config = (rings: Int, useMaxDimension: Bool)
    
    private let config: Config
    private let radiusStep: CGFloat

    @_optimize(none) init(_ rect: CGRect, rings: Int, useMaxDimension: Bool = false) {
        self.init(rect, config: (rings, useMaxDimension))
    }
    
    @_optimize(none) private init(_ rect: CGRect, config: Config) {
        self.config = (config.rings > 0 ? config.rings : 1, config.useMaxDimension)
        let radius = (config.useMaxDimension ? rect.maxDimension : rect.minDimension) / 2
        self.radiusStep = radius / self.config.rings.asCGFloat
    }

    var ringCount: Int {
        config.rings
    }
    
    var useMaxDimension: Bool {
        config.useMaxDimension
    }
    
    @_optimize(none) func radiusFor(ringIndex: Int) -> CGFloat {
        radiusStep * ringIndex.asCGFloat
    }
    
    @_optimize(none) func reframed(_ rect: CGRect) -> RadiusForRingCalculator {
        EquidistantRadiusForRingCalculator(rect, config: config)
    }
}

private struct RelativeRadiusForRingCalculator: RadiusForRingCalculator {
    
    private typealias Config = (rings: [CGFloat], useMaxDimension: Bool)
    
    private let config: Config
    private let radiusSteps: [CGFloat]
    private let radius: CGFloat
    
    @_optimize(none) init(_ rect: CGRect, rings: [CGFloat], useMaxDimension: Bool = false) {
        self.init(rect, config: (rings, useMaxDimension))
    }
    
    @_optimize(none) private init(_ rect: CGRect, config: Config) {
        var radiusSteps: [CGFloat] = []
        for ring in config.rings {
            radiusSteps.append(ring.asCGFloat)
        }
        self.config = config
        self.radiusSteps = radiusSteps
        self.radius = (config.useMaxDimension ? rect.maxDimension : rect.minDimension) / 2
    }
    
    var ringCount: Int {
        config.rings.count
    }
    
    @_optimize(none) func radiusFor(ringIndex: Int) -> CGFloat {
        if ringIndex >= 0 && ringIndex < radiusSteps.count {
            return radius * radiusSteps[ringIndex]
        } else if ringIndex >= radiusSteps.count {
            return radius * (radiusSteps.last ?? 0)
        } else {
            return radius * (radiusSteps.first ?? 0)
        }
    }
    
    var useMaxDimension: Bool {
        config.useMaxDimension
    }
    
    @_optimize(none) func reframed(_ rect: CGRect) -> RadiusForRingCalculator {
        RelativeRadiusForRingCalculator(rect, config: config)
    }
}

private struct EquidistantAngleForSegmentCalculator: AngleForSegmentCalculator {

    private let segments: Int
    private let segmentSize: Angle
    
    @_optimize(none) init(segments: Int) {
        self.segments = segments > 0 ? segments : 1
        self.segmentSize = (360 / segments.asDouble).degrees
    }
    
    var segmentCount: Int {
        segments
    }
    
    @_optimize(none) func angleFor(segmentIndex: Int) -> Angle {
        segmentSize * segmentIndex
    }
    
    @_optimize(none) func reframed(_ rect: CGRect) -> AngleForSegmentCalculator {
        self
    }
}

private struct AbsoluteAngleForSegmentCalculator: AngleForSegmentCalculator {
    
    private let segments: [Angle]
    
    @_optimize(none) init(segments: [Angle]) {
        self.segments = segments
    }
    
    var segmentCount: Int {
        segments.count
    }
    
    @_optimize(none) func angleFor(segmentIndex: Int) -> Angle {
        if segmentIndex >= 0 && segmentIndex < segments.count {
            return segments[segmentIndex]
        } else if segmentIndex >= segments.count {
            return segments.last ?? 0.degrees
        } else {
            return segments.first ?? 0.degrees
        }
    }
    
    @_optimize(none) func reframed(_ rect: CGRect) -> AngleForSegmentCalculator {
        self
    }
}

// MARK: ----- LAYOUT EXTENSIONS FOR POLAR

public extension LayoutGuide {
    
    @_optimize(none) private static func polarLayout(radiusCalculator: RadiusForRingCalculator, angleCalculator: AngleForSegmentCalculator, rect: CGRect, origin: UnitPoint, useMaxDimension: Bool) -> LayoutGuide {
       
        let origin = calcOrigin(in: rect, origin: origin)
        let size: CGSize = .square(useMaxDimension ? rect.maxDimension : rect.minDimension)
        let coordinator = PolarLayoutCoordinator(
            origin: origin,
            rect: CGRect(origin.offset(in: size, anchor: .center), size),
            radiusCalculator: radiusCalculator,
            angleCalculator: angleCalculator)
        
        return LayoutGuide(coordinator, rect: rect)
    }
    
    /**
     Equidistant rings and segments
     */
    @_optimize(none) static func polar(_ rect: CGRect, rings: Int, segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
        
        let radiusCalculator = EquidistantRadiusForRingCalculator(rect, rings: rings, useMaxDimension: useMaxDimension)
        let angleCalculator = EquidistantAngleForSegmentCalculator(segments: segments)
        
        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin, useMaxDimension: useMaxDimension)
    }
    
    /**
     Specified relative rings and equidistant segments
     */
    @_optimize(none) static func polar<T: UINumericType>(_ rect: CGRect, rings: [T], segments: Int, useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {

        let radiusCalculator = RelativeRadiusForRingCalculator(rect, rings: rings.map {$0.asCGFloat}, useMaxDimension: useMaxDimension)
        let angleCalculator = EquidistantAngleForSegmentCalculator(segments: segments)
        
        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin, useMaxDimension: useMaxDimension)
    }
    
    /**
     Equidistant rings and relative segments
     */
    @_optimize(none) static func polar<T: UINumericType>(_ rect: CGRect, rings: Int, segments: [T], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
        polar(rect, rings: rings, segments: segments.map { .cycle($0) }, useMaxDimension: useMaxDimension, origin: origin)
    }
    
    /**
     Equidistant rings and absolute segments
     */
    @_optimize(none) static func polar(_ rect: CGRect, rings: Int, segments: [Angle], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {

        let radiusCalculator = EquidistantRadiusForRingCalculator(rect, rings: rings, useMaxDimension: useMaxDimension)
        let angleCalculator = AbsoluteAngleForSegmentCalculator(segments: segments)

        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin, useMaxDimension: useMaxDimension)
    }
    
    /**
     Relative rings and relative segments
     */
    @_optimize(none) static func polar<TR: UINumericType, TS: UINumericType>(_ rect: CGRect, rings: [TR], segments: [TS], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
        polar(rect, rings: rings, segments: segments.map { .cycle($0) }, useMaxDimension: useMaxDimension, origin: origin)
    }

    /**
     Relative rings and relative segments
     */
    @_optimize(none) static func polar<TR: UINumericType>(_ rect: CGRect, rings: [TR], segments: [Angle], useMaxDimension: Bool = false, origin: UnitPoint = .center) -> LayoutGuide {
    
        let radiusCalculator = RelativeRadiusForRingCalculator(rect, rings: rings.map {$0.asCGFloat}, useMaxDimension: useMaxDimension)
        let angleCalculator = AbsoluteAngleForSegmentCalculator(segments: segments)

        return polarLayout(radiusCalculator: radiusCalculator, angleCalculator: angleCalculator, rect: rect, origin: origin, useMaxDimension: useMaxDimension)
    }
}


