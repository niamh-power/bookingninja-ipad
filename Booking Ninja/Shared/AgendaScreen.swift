import SwiftUI

struct AgendaScreen: View {
    let backgroundColor = UIColor(named: "backgroundColor")

    @ObservedObject var viewModel: AgendaViewModel

    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            switch viewModel.state {
            case .Success(let bookings):
                ForEach(bookings, id: \.id) { booking in
                    HStack(spacing: 6) {
                        Image(systemName: "calendar.badge.clock")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 12, height: 12)
                            .foregroundColor(Color.primary)
                        
                        Text(booking.name)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }

            case .Loading(let text):
                Text(text)
            }
        }
    }
}
