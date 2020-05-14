/**You are given an array coordinates, coordinates[i] = [x, y], where [x, y] represents the coordinate of a point. Check if these points make a straight line in the XY plane.*/

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let x1 = coordinates[0][0]
        let y1 = coordinates[0][1]
        
        let x2 = coordinates[1][0]
        let y2 = coordinates[1][1]
        
        let slope = Double(y2 - y1) / Double(x2 - x1)
        
        for i in 2..<coordinates.count {
            let coordinate = coordinates[i]
            let x = coordinate[0]
            let y = coordinate[1]
            
            if Double(y - y1) / Double(x - x1) != slope {
                return false
            }
        }
        
        return true
    }
}
