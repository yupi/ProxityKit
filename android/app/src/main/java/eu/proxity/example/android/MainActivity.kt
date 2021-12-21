package eu.proxity.example.android

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import io.ktor.util.*

import eu.proxity.proxitykit.*

@InternalAPI
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        ProxityClient.configure(
            "76C3A87B-6628-4460-BFE9-EED00A45B1FF",
            platform = Platform(this),
            endpoint = "https://api.proxity.eu/nearby",
            delegate = object : ProxityDelegate {
                override fun onMessage(message: Message) {
                    println(message)
                }

                override fun onFilterMessage(tags: List<String>?): Boolean {
                    return true
                }

                override fun onWebhook(id: String): String {
                    return ""
                }
            }
        )
        ProxityClient.start()
    }
}