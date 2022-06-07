import XCTest
@testable import Web3_Swift

class Web3_SwiftTest: XCTestCase {
    
    let web3 = Web3(rpcURL: "https://devnetopenapi2.platon.network/rpc",rpcId: 2203181)
    
    override func setUpWithError() throws {
        
    }
    
    func testChainId() {
        
        let expection = self.expectation(description: "\(#function)")
        web3.eth.chainId { resp in
            switch resp.status {
            case .success(let chainId):
                XCTAssertEqual(Int(chainId0xString: chainId), 2203181)
                expection.fulfill()
            case .failure(let error):
                XCTAssertThrowsError(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 2) { error in
            print(error?.localizedDescription ?? "")
        }
    }
    
    func testUIntBytesRepresentable() {
        let zero = UInt(0).makeBytes()
        XCTAssertEqual(zero.count, MemoryLayout<UInt>.size)
        
        for i in 0 ..< MemoryLayout<UInt>.size {
            XCTAssertEqual(zero[i], 0x00)
        }
        
        let max = UInt.max.makeBytes()
        XCTAssertEqual(max.count, MemoryLayout<UInt>.size)
        
        for i in 0 ..< MemoryLayout<UInt>.size {
            XCTAssertEqual(max[i], 0xff)
        }
        
        let two = UInt(1024).makeBytes()
        XCTAssertEqual(two.count, MemoryLayout<UInt>.size)
        
        for i in 0 ..< MemoryLayout<UInt>.size - 2 {
            XCTAssertEqual(two[i], 0x00)
        }
        XCTAssertEqual(two[MemoryLayout<UInt>.size - 2], 0x04)
        XCTAssertEqual(two[MemoryLayout<UInt>.size - 1], 0x00)
        
        
//        let bytes = "1024".makeBytes()
//        let data = Data(bytes)
//        let bts = data.makeBytes()
        
    }
    
}

extension Int {
    func toBool() -> Bool {
        return (self as NSNumber).boolValue
    }

    func toString() -> String {
        return String(self)
    }

    //We'll take both "0x12" and "18" as `18`. The former is as spec like https://eips.ethereum.org/EIPS/eip-695, the latter to be more forgiving of dapps
    init?(chainId0xString string: String) {
        if string.has0xPrefix {
            if let i = Int(string.drop0x, radix: 16) {
                self = i
            } else {
                return nil
            }
        } else {
            if let i = Int(string) {
                self = i
            } else {
                return nil
            }
        }
    }
}

extension String {
    var has0xPrefix: Bool {
        return hasPrefix("0x")
    }

    var isPrivateKey: Bool {
        let value = self.drop0x.components(separatedBy: " ").joined()
        return value.count == 64
    }

    var drop0x: String {
        if count > 2 && substring(with: 0..<2) == "0x" {
            return String(dropFirst(2))
        }
        return self
    }
    

    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    
    func index(from: Int) -> Index {
        return index(startIndex, offsetBy: from)
    }
}
