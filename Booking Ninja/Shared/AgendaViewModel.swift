import Combine
import Foundation

@available(iOS 15, *)
final class AgendaViewModel: ObservableObject {
    @Published private(set) var state: AgendaViewState = .Loading(text: "Loading")
    
    private var bookings: [Booking] = [
        Booking(id: 1, name: "John Doe", start: Date.now, covers: 3, table: 2),
        Booking(id: 2, name: "Jane Doe", start: Date.now, covers: 3, table: 2),
        Booking(id: 3, name: "Mary Doe", start: Date.now, covers: 3, table: 2)
    ]
    
    init() {
        getBookings()
    }
    
    func getBookings() {
        state = .Success(bookings: bookings)
    }
}

enum AgendaViewState {
    case Loading(text: String)
    case Success(bookings: [Booking])
}

struct Booking {
    var id: Int
    var name: String
    var start: Date
    var covers: Int
    var table: Int
}
