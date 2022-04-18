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
    static var linkinPark = """
    Mike Shinoda has rejected the idea of a hologram image of Chester Bennington touring with Linkin Park.
    The musician, who co-founded the band, was responding to a fan during an Instagram live as the question arose to what Linkin Park's plans were for future tours.
    """
    
    static var britneySpears = """
    Britney Spears has announced she is pregnant, months after she escaped the legal arrangement that gave her father control over many aspects of her life.
    The singer told her 40 million Instagram followers she was having a baby with partner Sam Asghari.
    The 40-year-old, who has two teenage sons, also revealed she suffered depression during a previous pregnancy.
    In June last year, she told a judge her conservatorship prevented her from marrying or removing her birth control.
    She has previously said she wanted a family with Asghari, a 28-year-old personal trainer.
    But the form of legal guardianship known as a conservatorship, set up by her father in 2008 after she experienced a public mental health crisis, meant she could not make her own decisions about her medical care.
    """
    
    static var snoopDog = """
    The woman who sued rapper Snoop Dogg for sexual assault has filed to drop her lawsuit.
    The lawsuit was filed in February, by an anonymous woman referred to in the suit as Jane Doe.
    The woman claimed she was assaulted by Snoop Dogg, real name Calvin Cordozar Broadus Jr, and his associate Don “Magic” Juan almost nine years ago, on 29 May 2013.
    The lawsuit was filed for withdrawal on Wednesday (6 April), according to US media reports.
    “It is not surprising that the plaintiff dismissed her complaint against the defendants,” a spokesperson for the 50-year-old said.
    """
    
}

struct Photos {
    static var listPhoto: [String] = ["1.jpg", "2.jpg", "3.jpeg", "4.jpg", "5.jpeg",
                                      "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg",
                                      "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg",
                                      "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg"]
}
