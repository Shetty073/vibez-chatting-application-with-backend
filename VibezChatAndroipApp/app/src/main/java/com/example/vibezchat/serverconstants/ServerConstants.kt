package com.example.vibezchat.serverconstants

class ServerConstants {
    companion object {
        var baseUrl: String = "http://192.168.1.100:3000/"
        // NOTE: Do not make userRoute private (even if android studio suggests it)
        var userRoute: String = "api/user/"
        var registerUserUrl: String = "${userRoute}register"
        var loginUserUrl: String = "${userRoute}login"
        var chatRoute: String = "api/chat/"
    }
}
