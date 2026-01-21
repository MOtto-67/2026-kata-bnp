import ClockCore

struct LampRow {
    let lampCount: Int
    let litCount: Int
    let kindForIndex: (Int) -> LampKind

    func make() -> [LampKind] {
        (0..<lampCount).map { index in
            index < litCount ? kindForIndex(index) : .off
        }
    }
}
