// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "./01_dysnomia.sol";
//import "./fa.sol";
struct Fa {
        uint64 Base;
        uint64 Secret;
        uint64 Signal;
        uint64 Channel;
        uint64 Contour;
        uint64 Pole;
        uint64 Identity;
        uint64 Foundation;
        uint64 Element;
        uint64 Coordinate;
        uint64 Charge;
        uint64 Chin;
        uint64 Monopole;
}
contract SHA is DYSNOMIA {
    string public constant Type = "SHA";

    Fa private Mu;
    uint64 public Dynamo;

    constructor(address MathLib) DYSNOMIA(MathLib) {
        Seed();
        Tune();
   
    }



    function View() public view returns(Fa memory) {
        return Mu;
    }

    function Seed() private {
        Mu.Base = Xiao.Random();
        Mu.Secret = Xiao.Random();
        Mu.Signal = Xiao.Random();
      
    }

   function Tune() private {
        Mu.Channel = Xiao.modExp64(Mu.Base, Mu.Signal, MotzkinPrime);   

    }

    function Fuse(uint64 _rho, uint64 Upsilon, uint64 Ohm) public onlyOwners {
        Mu.Base = Upsilon;
        Mu.Secret = Ohm;
        Mu.Signal = _rho;

    }

    function Avail(uint64 Xi) public onlyOwners {
        Mu.Contour = Xiao.modExp64(Xi, Mu.Secret, MotzkinPrime);

    }

    function Form(uint64 Chi) public onlyOwners {
        Mu.Base = Xiao.modExp64(Chi, Mu.Secret, MotzkinPrime);
        Tune();

    }

    function Polarize() public onlyOwners {
        Mu.Pole = Xiao.modExp64(Mu.Base, Mu.Secret, MotzkinPrime);

    }

    function Conjugate(uint64 Chi) public onlyOwners {
        Mu.Coordinate = Xiao.modExp64(Chi, Mu.Secret, MotzkinPrime);

    }

    function Conify(uint64 _Beta) public onlyOwners {
        Mu.Identity = _Beta;
        Mu.Foundation = Xiao.modExp64(Mu.Base, Mu.Identity, MotzkinPrime);

    }

    function Saturate(uint64 _Beta, uint64 Epsilon, uint64 Theta) public onlyOwners {
        if(Mu.Identity == 0) {
            Mu.Identity = _Beta;
            Mu.Foundation = Xiao.modExp64(Mu.Base, Mu.Identity, MotzkinPrime);
    
        }
        
        uint64 Beta = Xiao.modExp64(Epsilon, Mu.Identity, MotzkinPrime);
        uint64 Rho = Xiao.modExp64(Theta, Mu.Identity, MotzkinPrime);
        uint64 Eta = Xiao.modExp64(Epsilon, Mu.Signal, MotzkinPrime);

        Mu.Charge = Rho + Eta;       
        Mu.Chin = Beta + Eta; 
        Mu.Element = Beta + Mu.Charge;

        Dynamo = Xiao.modExp64(Theta, Mu.Signal, MotzkinPrime);
        Mu.Monopole = Xiao.modExp64(Mu.Chin, Mu.Identity, MotzkinPrime);

    }

    function Bond() public onlyOwners {
        Dynamo = Xiao.modExp64(Mu.Base, Mu.Signal, Mu.Element);
        Mu.Pole = 0;

    }

    function Adduct(uint64 _Phi) public returns(uint64) {

        return Xiao.modExp64(_Phi, Mu.Signal, Mu.Element);
    }

    error ReactionZeroError(uint64 Eta, uint64 Kappa);
    function React(uint64 Pi, uint64 Theta) public returns(uint64, uint64) {
        uint64 Eta = Xiao.modExp64(Pi, Mu.Channel, Theta);
        uint64 Kappa = Xiao.modExp64(Pi, Theta, Mu.Channel);
        if(Eta == 0 || Kappa == 0) revert ReactionZeroError(Eta, Kappa);

        return(Eta, Kappa);
    }
}