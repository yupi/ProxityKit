import SwiftUI
import ProxityKit

class AppProxityDelegate: ProxityDelegate {
    // Use this callback for prefiltering messages based on their tag ids.
    func onFilterMessage(tags: [String]?) -> Bool {
        return true
    }

    // The callback for delivering message content.
    func onMessage(message: Message) {
        print(message)
    }

    // Use this callback to set an auxillary data for the webhook.
    func onWebhook(id: String) -> String {
        return ""
    }
}

struct ContentView: View {
    init() {
        let proxity = ProxityClient()
        proxity.configure(
            //apiKey: "<YUOR-API-KEY>",
            apiKey: "76C3A87B-6628-4460-BFE9-EED00A45B1FF",
            delegate: AppProxityDelegate(),
            platform: Platform(),
            lang: "en",
            endpoint: "https://api.proxity.eu/nearby"
        )
        proxity.start()
    }

	var body: some View {
		Text("Proxity integration example")
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
