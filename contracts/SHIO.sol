// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "./01_dysnomia.sol";
import "./02d_shafactoryinterface.sol";
import "./02b_shainterface.sol";
import "./Ownable.sol";
struct Shao {
    SHA Rod;
    SHA Cone;

    uint64 Barn;
}

contract SHIO is DYSNOMIA{
    string public constant Type = "SHIO";
  
    Shao public Rho;
    uint64 public Manifold;
    uint64 public Monopole;

    event LogEvent(uint64 Soul, uint64 Aura, string LogLine);
  SHAFactory SHAf = SHAFactory(0x92f3B6EFe7D4eC4152249F9B07e89132a8487f1E);
    constructor(address MathLib) DYSNOMIA(MathLib) {
        
        Rho.Rod = SHA(SHAf.New(0xD1CDF9d71f8752034C30893FFE9E073128225B33));
        Rho.Cone = SHA(SHAf.New(0xD1CDF9d71f8752034C30893FFE9E073128225B33));
      
    }



    function Log(uint64 Soul, uint64 Aura, string memory LogLine) public onlyOwners {
        emit LogEvent(Soul, Aura, LogLine);
    }

    function Rod() public view returns(SHA) {
        return Rho.Rod;
    }

    function Cone() public view returns(SHA) {
        return Rho.Cone;
    }

    function ConductorGenerate(uint64 Xi) private {
        Rho.Rod.Avail(Xi);
        Rho.Cone.Avail(Xi);

        Rho.Rod.Form(Rho.Cone.View().Contour);
        Rho.Cone.Form(Rho.Rod.View().Contour);

        Rho.Rod.Polarize();
        Rho.Cone.Polarize();
   
    }

    function Generate(uint64 Xi, uint64 Alpha, uint64 Beta) public onlyOwners {
        ConductorGenerate(Xi);

        Rho.Rod.Conjugate(Rho.Cone.View().Pole);
        Rho.Cone.Conjugate(Rho.Rod.View().Pole);

        Rho.Cone.Conify(Alpha);

        Rho.Rod.Saturate(Alpha, Rho.Cone.View().Foundation, Rho.Cone.View().Channel);
        Rho.Cone.Saturate(Beta, Rho.Rod.View().Foundation, Rho.Rod.View().Channel);

    }

    function Isomerize() public onlyOwners {
        Rho.Rod.Bond();
    
    }

    function Isolate() public onlyOwners {
        Rho.Cone.Bond();

    }

    error ManifoldInequality(uint64 Manifold);
    error RingInequality(uint64 Ring);
    error BarnInequality(uint64 Barn);
    function Magnetize() public onlyOwners returns(uint64) {
        Manifold = Rho.Rod.Adduct(Rho.Cone.Dynamo());
        if(Manifold != Rho.Cone.Adduct(Rho.Rod.Dynamo())) revert ManifoldInequality(Manifold);

        uint64 Ring = Xiao.modExp64(Rho.Rod.View().Coordinate, Manifold, Rho.Rod.View().Element);
        if(Ring != Xiao.modExp64(Rho.Cone.View().Coordinate, Manifold, Rho.Cone.View().Element)) revert RingInequality(Ring);

        Rho.Barn = Xiao.modExp64(Ring, Manifold, Rho.Rod.View().Element);
        if(Rho.Barn != Xiao.modExp64(Ring, Manifold, Rho.Cone.View().Element)) revert BarnInequality(Rho.Barn);

        Monopole = Xiao.modExp64(Rho.Rod.View().Chin, Rho.Cone.View().Chin, MotzkinPrime);

        return Ring;
    }

    error ReactionZeroError(uint64 Eta, uint64 Kappa);
    error ReactionInequalityError(uint64 Eta, uint64 Kappa);
    function React(uint64 Pi) public returns(uint64, uint64) {
        Pi = Pi ^ Monopole;
        (uint64 Eta, uint64 Kappa) = Rho.Rod.React(Pi, Rho.Cone.View().Channel);
        (uint64 Omicron, uint64 Omega) = Rho.Cone.React(Pi, Rho.Rod.View().Channel);
        if((Omicron != Kappa || Omega != Eta)) revert ReactionInequalityError(Eta, Kappa);
        if(Omega == 0 || Omicron == 0) revert ReactionZeroError(Eta, Kappa);

        return(Omicron, Omega);
    }
}