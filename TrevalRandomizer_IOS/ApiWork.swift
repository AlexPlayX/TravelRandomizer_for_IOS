//
//  ApiWork.swift
//  TRfIOS
//
//  Created by Alexey on 12/5/19.
//  Copyright © 2019 Алексей. All rights reserved.
//

import Foundation


var cordin:String = ""
var urli:String = ""
var text:String = ""


class ApiWork {

    public func randomize() -> (contry:String,city:String){
        sync()
    let contrys = "+Abkhazia-Sukhumi+Afghanistan-Kabul+Albania-Tirana+Algeria-Algiers+Andorra-Andorra+Angola-Luanda+Antigua-Saint+Argentina-Buenos+Armenia-Yerevan+Australia-Canberra+Austria-Vienna+Azerbaijan-Baku+Bahamas-Nassau+Bahrain-Manama+Bangladesh-Dhaka+Barbados-Bridgetown+Belarus-Minsk+Belgium-Brussels+Belize-Belmopan+Benin-Porto-Novo+Bhutan-Thimphu+Bolivia-Sucre+Bosnia-Sarajevo+Botswana-Gaborone+Brazil-Brasilia+Brunei-Bandar+Bulgaria-Sofia+Burkina-Ouagadougou+Burundi-Gitega+Cambodia-Phnom+Cameroon-Yaounde+Canada-Ottawa+Cape-Praia+Central-Bangui+Chad-NDjamena+Chile-Santiago+China-Beijing+Colombia-Bogota+Comoros-Moroni+Congo-Brazzaville+Costa-San+Cote-Yamoussoukro+Croatia-Zagreb+Cuba-Havana+Cyprus-Nicosia+Czech-Prague+Denmark-Copenhagen+Djibouti-Djibouti+Dominica-Roseau+Dominican-Santo+DR-Kinshasa+East-Dili+Ecuador-Quito+Egypt-Cairo+El-San+Equatorial-Malabo+Eritrea-Asmara+Estonia-Tallinn+Eswatini-Mbabane+Ethiopia-Addis+Federated+Micronesia+Micronesia-Palikir+Fiji-Suva+Finland-Helsinki+France-Paris+Gabon-Libreville+Gambia-Banjul+Georgia-Tbilisi+Germany-Berlin+Ghana-Accra+Greece-Athens+Grenada-Saint+Guatemala-Guatemala+Guinea-Conakry+Guinea-Bissau+Guyana-Georgetown+Haiti-Port-au-Prince+Honduras-Tegucigalpa+Hungary-Budapest+Iceland-Reykjavik+India-New+Indonesia-Jakarta+Iran-Tehran+Iraq-Baghdad+Ireland-Dublin+Israel-Jerusalem+Italy-Rome+Jamaica-Kingston+Japan-Tokyo+Jordan-Amman+Kazakhstan-Nur-Sultan+Kenya-Nairobi+Kiribati-Tarawa+Kuwait-Kuwait+Kyrgyzstan-Bishkek+Laos-Vientiane+Latvia-Riga+Lebanon-Beirut+Lesotho-Maseru+Liberia-Monrovia+Libya-Tripoli+Liechtenstein-Vaduz+Lithuania-Vilnius+Luxembourg-Luxembourg+Macedonia-Skopje+Madagascar-Antananarivo+Malawi-Lilongwe+Malaysia-Kuala+Maldives-Male+Mali-Bamako+Malta-Valletta+Marshall-Majuro+Mauritania-Nouakchott+Mauritius-Port+Mexico-Mexico+Moldova-Chisinau+Monaco-Monaco+Mongolia-Ulaanbaatar+Montenegro-Podgorica+Morocco-Rabat+Mozambique-Maputo+Myanmar-Naypyidaw+Namibia-Windhoek+Nauru-No+Nepal-Kathmandu+Netherlands-Amsterdam+New-Wellington+Nicaragua-Managua+Niger-Niamey+Nigeria-Abuja+North-Pyongyang+Norway-Oslo+Oman-Muscat+Pakistan-Islamabad+Palau-Ngerulmud+Panama-Panama+Papua-Port+Paraguay-Asuncion+Peru-Lima+Philippines-Manila+Poland-Warsaw+Portugal-Lisbon+Qatar-Doha+Romania-Bucharest+Russia-Moscow+Rwanda-Kigali+Saint-Basseterre+Saint-Castries+Saint-Kingstown+Samoa-Apia+San-San+Sao-Sao+Saudi-Riyadh+Senegal-Dakar+Serbia-Belgrade+Seychelles-Victoria+Sierra-Freetown+Singapore-Singapore+Slovakia-Bratislava+Slovenia-Ljubljana+Solomon-Honiara+Somalia-Mogadishu+South-Pretoria+South-Seoul+South-Tskhinvali+South-Juba+Spain-Madrid+Sri-Sri+State+Palestine+Palestine-Jerusalem+Sudan-Khartoum+Suriname-Paramaribo+Sweden-Stockholm+Switzerland-Bern+Syria-Damascus+Tajikistan-Dushanbe+Tanzania-Dodoma+Thailand-Bangkok+Togo-Lome+Tonga-Nukualofa+Trinidad-Port-of-Spain+Tunisia-Tunis+Turkey-Ankara+Turkmenistan-Ashgabat+Tuvalu-Funafuti+Uganda-Kampala+Ukraine-Kyiv+United-Abu+United-London+United+America+America-Washington+Uruguay-Montevideo+Uzbekistan-Tashkent+Vanuatu-Port-Vila+Vatican-Vatican+Venezuela-Caracas+Vietnam-Hanoi+Yemen-Sanaa+Zambia-Lusaka+Zimbabwe-Harare    "

        let contryChar = [Character](contrys)
        var flag = -1
        var contryCity : (contry:String, city:String) = ("", "")
        let ran = Int.random(in: 1...209)
               var j = 0
               for i in 0...contrys.count-1 {
                   if(contryChar[i] == "+"){
                        j+=1
                   }
                if(j == ran && flag < 0){
                    flag = 1
                }
                if(flag > 0){
                    if ((contryChar[i] == "-") || (contryChar[i+1] == "+") || (contryChar[i] == "+") ){
                        if((contryChar[i+1] == "+") || (contryChar[i] == "+")){
                                flag = -1
                        }
                        else{                    if(contryChar[i] == "-")
                            {
                                flag=2
                               //var t = contryChar[i]
                            }
                        }
                    }
                    if(flag == 1){
                        contryCity.contry.append(contryChar[i])
                    }   else   {
                        if(flag == 2 && contryChar[i] != "-"){
                        contryCity.city.append(contryChar[i])
                        }
                    }
               }
        }
        return contryCity
    }

    public func apiOpenInfo(contry:String) -> (urli:String,text:String,lat:Double,log:Double){
        let urlSt="https://restcountries.eu/rest/v2/alpha/"+contry[0...2]
        let url=urlSt
        var _:(cordin:String,urli:String,text:String)
        let request = URLRequest(url: URL(string: url)!)
        let latLeng = request.httpBody as Codable
        print(latLeng)
        let task = URLSession.shared.dataTask(with: request){ data, response, error in
            guard let data = data, error == nil else {
                print("error=\(error)")
                return
            }
            var _:(cordin:String,urli:String,text:String)
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response )")
            }
            let str = (String(data: data, encoding: .utf8)!) as Codable
            //let rid = String(data: str as! Data, encoding: .utf8) as Codable
            guard
            let strigForm = str as? String
                else {return}
            var charG = [Character](strigForm)
            var cordinate:String = ""
            var urlJ:String = ""
            var flagD = 0
            var flagT = 0
            for kit in 4...charG.count-1{
                 if (flagD == 1)
                 {
                    cordinate.append(charG[kit])
                }
                if(charG[kit-4] == "g" && charG[kit-2] == ":" && charG[kit] == "h"){
                    flagT = 1
                }
                if(charG[kit-3] == "g" && charG[kit-1] == ":" && charG[kit] == "["){
                    flagD = 1
                }
                if( flagD == 1 && charG[kit+1] == "]"){
                    flagD = 0
                }
                if( flagD == 1 && charG[kit+2] == "g"){
                    flagT = 0
                }
                if (flagT == 1){
                    urlJ.append(charG[kit])
                }
            }
            cordin=cordinate
            urli=urlJ
            print(urli)
            var t = 20
            let kit = 0
            while(charG[kit] != "\n"){
                if(charG[kit] == "[" || charG[kit] == "]" || charG[kit] == "{" || charG[kit] == "}"){
                    charG.remove(at: kit)
                    t+=1
                }
            }

            text=String(charG)

        }
        let hy=cor(cordinate: cordin)
        let hV = HistoryView()
        hV.savePlace(contry:contry, info:text, image:urli)
        return ( urli,text,hy.lat,hy.log)
        task.resume()
        }

    private func cor(cordinate:String) ->(lat:Double,log:Double){
        var latD:Double = 0
        var logD:Double = 0
        print ("")
        let tit = [Character](cordinate)
        repeat {
            if (tit.count != 0){
        var str:String = ""
        for i in 0...tit.count{

            str.append(tit[i])
            if(tit[i]==","){
                latD=Double(str)!
            }else{
                str.append(tit[i])
            }
        }
                logD=Double(str)!

            }
            else {}
        } while(logD == 0)
        return (latD, logD)
    }

}
extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound) ?? endIndex
        return String(self[start...end])
    }

    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}



struct Product: Codable {
    var name:String
    var topLevelDomain:String
    var alpha2Code:Int
    var alpha3Code:String
    var callingCodes:Double
    var capital:Int
    var region:String
    var price:Double
    var quantity:Int
    var altSpellings:String
    var subregion:String
    var population:Double
    var latlng:String
    var demonym:String
    var area:Double
    var gini:Double
    var timezones:String
    var borders:String
    var nativeName:String
    var numericCode:String
    var currencies:String
    var language:String
    var translations:String
    var flag:String
    var regionalBlocs:String
  enum CodingKeys: String, CodingKey {
           case name
           case topLevelDomain
           case alpha2Code
           case alpha3Code
           case callingCodes
           case capital
           case region
           case price
           case quantity
           case altSpellings
           case subregion
           case population
           case latlng
           case demonym
           case area
           case gini
           case timezones
           case borders
           case nativeName
           case numericCode
           case currencies
           case language
           case translations
           case flag
           case regionalBlocs
  }
  func encode(to encoder: Encoder) throws {
  var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(topLevelDomain,forKey:.topLevelDomain)
    try container.encode(alpha2Code,forKey:.alpha2Code)
    try container.encode(alpha3Code,forKey:.alpha3Code)
    try container.encode(callingCodes,forKey:.callingCodes)
    try container.encode(capital,forKey:.capital)
    try container.encode(region,forKey:.region)
    try container.encode(price,forKey:.price)
    try container.encode(quantity,forKey:.quantity)
    try container.encode(altSpellings,forKey:.altSpellings)
    try container.encode(subregion,forKey:.subregion)
    try container.encode(population,forKey:.population)
    try container.encode(latlng,forKey:.latlng)
    try container.encode(demonym,forKey:.demonym)
    try container.encode(area,forKey:.area)
    try container.encode(gini,forKey:.gini)
    try container.encode(timezones,forKey:.timezones)
    try container.encode(borders,forKey:.borders)
    try container.encode(nativeName,forKey:.nativeName)
    try container.encode(numericCode,forKey:.numericCode)
    try container.encode(currencies,forKey:.currencies)
    try container.encode(language,forKey:.language)
    try container.encode(translations,forKey:.translations)
    try container.encode(flag,forKey:.flag)
try container.encode(regionalBlocs,forKey:.regionalBlocs)
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)

    name = try container.decode(String.self, forKey: .topLevelDomain)
    topLevelDomain = try container.decode(String.self, forKey: .alpha2Code)
    alpha2Code = try container.decode(Int.self, forKey: .alpha3Code)
    alpha3Code = try container.decode(String.self, forKey: .callingCodes)
    callingCodes = try container.decode(Double.self, forKey: .capital)
    capital = try container.decode(Int.self, forKey: .region)
    region = try container.decode(String.self, forKey: .price)
    price = try container.decode(Double.self, forKey: .quantity)
    quantity = try container.decode(Int.self, forKey: .altSpellings)
    altSpellings = try container.decode(String.self, forKey: .subregion)
    subregion = try container.decode(String.self, forKey: .population)
    population = try container.decode(Double.self, forKey: .latlng)
    latlng = try container.decode(String.self, forKey: .demonym)
    demonym = try container.decode(String.self, forKey: .area)
    area = try container.decode(Double.self, forKey: .gini)
    gini = try container.decode(Double.self, forKey: .timezones)
    timezones = try container.decode(String.self, forKey: .borders)
    borders = try container.decode(String.self, forKey: .nativeName)
    nativeName = try container.decode(String.self, forKey: .numericCode)
    numericCode = try container.decode(String.self, forKey: .currencies)
    currencies = try container.decode(String.self, forKey: .language)
    language = try container.decode(String.self, forKey: .translations)
    translations = try container.decode(String.self, forKey: .flag)
    flag = try container.decode(String.self, forKey: .regionalBlocs)
    regionalBlocs = try container.decode(String.self, forKey: .name)

  }
}

