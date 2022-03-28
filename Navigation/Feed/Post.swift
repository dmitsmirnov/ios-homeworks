//
//  Post.swift
//  Navigation
//
//  Created by Дмитрий Смирнов on 15.03.2022.
//

import UIKit

struct Post {
    
    struct Article {
        var author, description, image: String
        var likes, views: Int
    }
    var articles: [Article]
}

struct News {
    static var eminem: String = """
    Marshall remains the most popular hip hop artist on YouTube. Over seven recent days, his videos have been watched over 103 million times globally. It is noticeably more than his recent contenders gained over the same period: Doja Cat – 86.9 million, NBA YoungBoy – 79 million, Drake – 57.7 million, Kanye West – 45.9 million views. Videos that attracted the most public attention primarily belong to Marshall’s golden era catalogue. However, “Venom”, released in 2018on “Kamikaze”, is ranked at the respectable third place. One of the most recent Em’s visuals, “Godzilla” feat. Juice WRLD, is his seventh most watched video this week.
    """
    static var basta: String = """
    5-го июня СК Арена принимает Басту в рамках его грандиозного тура имени своего имени «Баста-19». Тура, который охватит максимальное количество городов, а значит и поклонников. Основным, но далеко не главным поводом для встречи, станет его очередной альбом под номером «пять», скачивание которого в сети, бьет все мыслимые и немыслимые рекорды. «Удивительный мир», «Там, где нас нет», «Выпускной».
    """
}

struct Photos {
    static var listPhoto: [String] = ["1.jpg", "2.jpg", "3.jpeg", "4.jpg", "5.jpeg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg",
                                      "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg"]
}
