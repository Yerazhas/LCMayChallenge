func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
    let x1 = coordinates[0][0]
    let y1 = coordinates[0][1]
    
    let x2 = coordinates[1][0]
    let y2 = coordinates[1][1]
    
    let slope = (y2 - y1) / (x2 - x1)
    
    for i in 2..<coordinates.count {
        let coordinate = coordinates[i]
        let x = coordinate[0]
        let y = coordinate[1]
        
        print("y:\(y), x:\(x), y1:\(y1), x1:\(x1)")
        let slope = (y - y1) / (x - x1)
        print("slope: \(slope)")
        if slope != slope {
            print("y:\(y), x:\(x), y1:\(y1), x1:\(x1)")
            return false
        }
    }
    
    return true
}

let arrs = [[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]]
print(checkStraightLine(arrs))
