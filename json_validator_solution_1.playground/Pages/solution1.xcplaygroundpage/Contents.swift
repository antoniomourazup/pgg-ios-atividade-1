import UIKit

/*
 From Risonaldo Moura
 */

/*
 This solution converts the json string to vector format and analyze
 each character, checking the pattern of each one. In the end,
 it also checks the character count for final validation.
 
 the complexity of this algorithm is O(N)
 */

var stringJson: String

//Cases:

//OK Json valid
stringJson = "[{\"my name is: Risonaldo\":\"Zup\",\"ab:v\": 8.9,\"valueInt\": }]"

//Erro Json invalid
//stringJson = "[}"
//stringJson = "[}]{"
//stringJson = "[[{]"
//stringJson = "[\"\"]"

//OK Json valid and is Empty
//stringJson = "[]"
//stringJson = "{}"
//stringJson = "\"\":\"\""


var stringCorreta: String
var contChave = 0
var contColchete = 0
var contAspas = 0
var contPoints = 0
var contValueInt = 0

let messageJsonInvalid = "Json Invalid"
let messageJsonInvalidAndEmpty = "Json Invalid but is Empty"
let messageJsonValid = "Json Valid"

func readArray(array: Array<Character>) -> Bool{
    
    var result = false
    
    for i in 0...array.count-1{
        
        print("Elemento lido:",array[i])
        
        incrementCounts(element: String(array[i]))
        
        //Verificar se não é o último dígito
        if(array.count-i > 1){
            let elementArray = String(array[i]) //Cast of Character to String
            let nextElementArray = String(array[i+1])
            
            if(!(verifyStringsFromArray(elementArray: elementArray, nextElement: nextElementArray))){
                break
            }
            else{
                result = true
            }
        }
        //Se for o útimo dígito
        else{
            result = validConts()
            
            print("ultimo digito")
            print("contChave", contChave)
            print("contColchete", contColchete)
            print("contAspas", contAspas)
            print("contValueInt", contValueInt)
            print("contPoints", contPoints)
        }
    }
    
    return result
}

func incrementCounts(element: String){
    if(element.contains("[") || element.contains("]")){
        contChave += 1
    }
    else if (element.contains("{") || element.contains("}")){
        contColchete += 1
    }
    else if (element.contains("\"")){
        
        contAspas += 1
    }
    else if (element.contains(":") && (contAspas % 2 == 0)){
        contPoints += 1
    }
}

func verifyStringsFromArray(elementArray: String, nextElement: String) -> Bool{
    
    var result: Bool
    
    if(elementArray.contains(":")){
        verifyPoints(nextString: nextElement)
    }
    
    if(elementArray.contains("[")){
        result = verifyChaveOpen(nextString: nextElement)
        setError(element: "[", result: result)
    }
    else if(elementArray.contains("]")){
        result = verifyChaveClose(nextString: nextElement)
        setError(element: "]", result: result)
    }
    else if(elementArray.contains("{")){
        result = verifyColcheteOpen(nextString: nextElement)
        setError(element: "{", result: result)
    }
    else if(elementArray.contains("}")){
        result = verifyColcheteClose(nextString: nextElement)
        setError(element: "}", result: result)
    }
    else if(elementArray.contains("\"")){
        result = verifyAspas(nextString: nextElement)
        setError(element: "\"", result: result)
    }
    else{
        print("Não mapeado")
        result = true
    }
    
    return result
}

func verifyChaveOpen(nextString: String) -> Bool{
    return nextString.contains("\"") ||
    nextString.contains("{")
    
}

func verifyChaveClose(nextString: String) -> Bool{
    return nextString.contains(",")
}

func verifyColcheteOpen(nextString: String) -> Bool{
    return nextString.contains("\"") ||
    nextString.contains("}")
}

func verifyColcheteClose(nextString: String) -> Bool{
    return nextString.contains(",") ||
    nextString.contains("]")
}

func verifyAspas(nextString: String) -> Bool{
    //return nextString.contains("}")
    return true
}

func verifyPoints(nextString: String) -> Bool{
    
    if((containsNumbers(string: nextString) ||
        containsCharacterPadrao(string: nextString)) &&
        (contAspas % 2 == 0)) {
        contValueInt += 1
    }
    return true
}

func validConts() -> Bool{
    return (contChave % 2 == 0 &&
            contColchete % 2 == 0 &&
            contAspas % 2 == 0 &&
            validPoints())
}

func validPoints() -> Bool{
    var result = false
    
    let fullAspas = contAspas+(2*contValueInt)
    
    if((fullAspas % 4 == 0) &&
        ((fullAspas/4) == contPoints))
    {
        //print(contAspas+(2*contValueInt))
        result = true
    }
    else{
        print("invalid validPoints", fullAspas)
    }
    
    return result
}

func setError(element: String, result: Bool){
    if(!result){
        showError(element: element)
    }
}

func showError(element: String){
    if(element.contains("[") || element.contains("]")){
        print("Error: you forget simbols \" or { or ,  ")
    }
    else if (element.contains("{") || element.contains("}")){
        print("Error: you forget simbols \" or ] or , ")
    }
    else if (element.contains("\"")){
        print("Error: you forget \" or : ")
    }
}

//Replace any character from any string
func replaceCharacter(_ stringOriginal: String, _ of: String, _ with: String ) -> String{
    
    return stringOriginal.replacingOccurrences(of: of, with: "", options: NSString.CompareOptions.literal, range: nil)
}

func verifyLengthArray(array:Array <Any>) -> Int{
    return array.count
}

func containsNumbers(string: String) -> Bool{
    
    let numbersRange = string.rangeOfCharacter(from: .decimalDigits)
    
    if let _ = numbersRange {
        return true
    } else {
        return false
    }
    
}

func containsCharacterPadrao(string: String) -> Bool{
    
    return string.contains("}")

}

func containsAspas(string: String) -> Bool{
    var result = false
    if(string.contains("\"")){
        result = true
    }
    
    return result
}

func trataJsonToArray(stringJson: String)->Array<Character>{
    //print(stringJson)
    return Array(replaceCharacter(replaceCharacter(stringJson, "\\", "")," ", ""))
}

func mainClass(s: String){

    let arrayJson = trataJsonToArray(stringJson: s)

    let cont = verifyLengthArray(array: arrayJson)
    print("LenghArray: ",cont)

    if(readArray(array: arrayJson)){
        print(messageJsonValid)
    }
    else{
        print(messageJsonInvalid)
    }
}

mainClass(s: stringJson)
