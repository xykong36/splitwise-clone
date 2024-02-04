/*
 See the License.txt file for this sample’s licensing information.
 */

import SwiftUI

struct LayingOutContainersView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.themeGreen)
                Circle()
                    .foregroundColor(.themePink)
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.themeBlue)
                    .frame(width: 200, height: 300)
                HStack {
                    Circle()
                        .foregroundColor(.themeRed)
                    Circle()
                        .foregroundColor(.themeOrange)
                }
            }
        }
    }
}

struct LayingOutContainersView_Previews: PreviewProvider {
    static var previews: some View {
        LayingOutContainersView()
    }
}
