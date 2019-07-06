/*
 Copyright (c) 2019, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3. Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import Foundation

/// An enumerator that specifies the paramters by which tasks can be queried.
public enum OCKTaskAnchor {
    case carePlanIdentifiers(_ identifiers: [String])
    case carePlanVersions(_ versionIDs: [OCKLocalVersionID])
    case taskIdentifiers(_ identifiers: [String])
    case taskVersions(_ versionIDs: [OCKLocalVersionID])
}

/// A query that limits which tasks will be returned when fetching.
public struct OCKTaskQuery: OCKDateIntervalQueryable {
    
    public var start: Date
    public var end: Date
    public var excludesTasksWithNoEvents: Bool

    /// - Parameters:
    ///   - start: A date defining the lower bound on queried tasks' start date.
    ///   - end: A date defining the upper bound on the queried tasks' end date.
    /// - Note: This initializer sets excludesTasksWithNoEvents to `false` by default. Set this flag to `true` to
    ///         require that the tasks resulting from a query have events occurring during the query's date range.
    ///         When set to false, tasks resulting from a query do not have a task resulting in the date ranging from
    ///         `start` to `end`.
    public init(start: Date, end: Date) {
        self.start = start
        self.end = end
        self.excludesTasksWithNoEvents = false
    }

    /// - Parameters:
    ///   - start: A date defining the lower bound on queried tasks' start date.
    ///   - end: A date defining the upper bound on the queried tasks' end date.
    ///   - excludesTasksWithNoEvents: A flag specifying whether tasks resulting from the task query must have
    ///                                events taking place on the day of `date`.
    public init(start: Date, end: Date, excludesTasksWithNoEvents: Bool) {
        self.start = start
        self.end = end
        self.excludesTasksWithNoEvents = excludesTasksWithNoEvents
    }

    /// - Parameters:
    ///   - date: Specifies the date of the day on which the task must be active. This does not mean that queried tasks
    ///           necessarily have events taking place on the day of `date`.
    ///   - excludesTasksWithNoEvents: A flag specifying whether tasks resulting from the task query must have
    ///                                events taking place on the day of `date`.
    public init(for date: Date, excludesTasksWithNoEvents: Bool) {
        self.init(for: date)
        self.excludesTasksWithNoEvents = excludesTasksWithNoEvents
    }
}
