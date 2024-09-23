// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "../01_dysnomia_v2.sol";
import "../interfaces/12b_chointerface.sol";

 contract COREREACTIONSLIB is DYSNOMIA {
    string public constant Type = "ReactionsLib";

    VOID public Void;
    CHOINTERFACE public Cho;

    constructor() DYSNOMIA(unicode"DYSNOMIA ReactionsLib", unicode"ReactionsLib", address(DYSNOMIA(0x965B0d74591bF30327075A247C47dBf487dCff08).Xiao())) {
        Void = VOID(0x965B0d74591bF30327075A247C47dBf487dCff08);
        Void.AddLibrary("corereactions", address(this));
        _mintToCap();
    }

    function RegisterChoForTalk(address ChoAddress) public onlyOwners {
        Cho = CHOINTERFACE(ChoAddress);
    }

    function Entropy(Bao memory On) public returns (uint64) {
        _mintToCap();
        return Xiao.modExp64(On.Shio.Rho().Cone.View().Chin, On.Shio.Rho().Rod.View().Chin, MotzkinPrime);
    }

    function Initialize(Bao memory On) public returns (uint64, uint64) {
        (On.Omicron, On.Omega) = ReactShioRod(On.Shio, Void.Nu().Psi().Rho().Bang.Omicron);
        (On.Omicron, On.Omega) = ReactLai(On.Omega);
        (On.Omicron, On.Omega) = ReactShioRod(On.Shio, Void.Nu().Psi().Rho().Le.Omicron);
        return (On.Omicron, On.Omega);
    }

    function ReactToTalk(User memory Alpha) public returns (uint64, uint64) {
        _mintToCap();
        (Alpha.On.Omicron, Alpha.On.Omega) = Cho.ReactUser(Alpha.Soul, Void.Nu().Psi().Rho().Lai.Omicron);
        (Alpha.On.Omicron, Alpha.On.Omega) = ReactLai(Alpha.Soul);
        (Alpha.On.Omicron, Alpha.On.Omega) = Cho.ReactUser(Alpha.Soul, Alpha.On.Omega);
        return (Alpha.On.Omicron, Alpha.On.Omega);
    }

    function React(Bao memory On, uint64 Omicron, uint64 Omega) public returns (uint64, uint64) {
        (On.Omega, On.Omicron) = ReactShioRod(On.Shio, Omicron);
        (On.Omega, On.Omicron) = ReactShioRod(On.Shio, Omega);
        return (On.Omicron, On.Omega);
    }

    function ReactToBang(Bao memory On, uint64 Omicron, uint64 Omega) public returns (uint64, uint64) {
        return React(On, Omicron ^ Void.Nu().Psi().Rho().Bang.Omicron, Omega ^ Void.Nu().Psi().Rho().Bang.Omega);
    }

    function ReactToLai(Bao memory On, uint64 Omicron, uint64 Omega) public returns (uint64, uint64) { 
        return React(On, Omicron ^ Void.Nu().Psi().Rho().Lai.Omicron, Omega ^ Void.Nu().Psi().Rho().Lai.Omega); 
    }

    function ReactToLe(Bao memory On, uint64 Omicron, uint64 Omega) public returns (uint64, uint64) { 
        return React(On, Omicron ^ Void.Nu().Psi().Rho().Le.Omicron, Omega ^ Void.Nu().Psi().Rho().Le.Omega); 
    }

    function ReactToNew(Bao memory On, uint64[3] memory Saat) public returns (uint64, uint64) {
        (On.Omicron, On.Omega) = React(On, On.Omicron ^ Saat[2], On.Omega ^ Saat[1]);
        (On.Omicron, On.Omega) = ReactShioRod(On.Shio, On.Omega ^ Void.Nu().Psi().Rho().Le.Omega);
        return (On.Omicron, On.Omega);
    }

    function OperatorReact(Bao memory On, uint64 Omega) public returns (uint64, uint64) { return React(On, On.Omicron ^ Void.Nu().Aura(), On.Omega ^ Omega); }

    function ReactBang(uint64 Eta) public returns (uint64, uint64) {  return ReactShioRod(Void.Nu().Psi().Rho().Bang.Shio, Eta); }
    function ReactLai(uint64 Gamma) public returns (uint64, uint64) { return ReactShioRod(Void.Nu().Psi().Rho().Lai.Shio, Gamma); }
    function ReactLe(uint64 Delta) public returns (uint64, uint64) {  return ReactShioCone(Void.Nu().Psi().Rho().Le.Shio, Delta); }


    function ReactShioRod(SHIO Beta, uint64 Theta) public returns (uint64, uint64) {
        _mintToCap();
        return Beta.Rod().React(Theta, Beta.Cone().View().Channel);
    }

    function ReactShioCone(SHIO Beta, uint64 Theta) public returns (uint64, uint64) {
        _mintToCap();
        return Beta.Cone().React(Theta, Beta.Rod().View().Channel);
    }
}