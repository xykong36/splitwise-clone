/// *
// See the License.txt file for this sample’s licensing information.
// */

import SwiftUI

struct AmazingAlignment: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            VStack(alignment: .trailing) {
                // 这里是直接套娃了 在VStack当中嵌套VStack
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))

                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 10)
            }
            Image(systemName: "books.vertical.fill")
                .font(.system(size: 40))
                .frame(maxWidth: .infinity, alignment: .trailing)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
            HStack(spacing: 20) {
                Spacer()
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .background(Color.yellow)
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 40))
                    .padding(.trailing, 20)
            }
            .background(Color.mint)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 10)
        }
        .padding(.horizontal)
        .frame(width: 250) // 这里的
        .border(Color.black)
    }
}

struct AmazingAlignment_Previews: PreviewProvider {
    static var previews: some View {
        AmazingAlignment()
    }
}
