/* Generated by Yosys 0.7 (git sha1 61f6811, i686-w64-mingw32.static-gcc 4.9.3 -Os) */

(* top =  1  *)
(* src = "ABSassign.v:2" *)
module absas(a, w);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  (* src = "ABSassign.v:2" *)
  input [7:0] a;
  (* src = "ABSassign.v:2" *)
  output [7:0] w;
  NAND _075_ (
    .A(_069_),
    .B(_026_),
    .Y(_022_)
  );
  NOR _076_ (
    .A(_069_),
    .B(_026_),
    .Y(_023_)
  );
  NOR _077_ (
    .A(_023_),
    .B(_017_),
    .Y(_025_)
  );
  NAND _078_ (
    .A(_025_),
    .B(_022_),
    .Y(_027_)
  );
  NAND _079_ (
    .A(_069_),
    .B(_017_),
    .Y(_029_)
  );
  NAND _080_ (
    .A(_029_),
    .B(_027_),
    .Y(_074_)
  );
  NOR _081_ (
    .A(_025_),
    .B(_018_),
    .Y(_031_)
  );
  NOT _082_ (
    .A(_018_),
    .Y(_032_)
  );
  NOT _083_ (
    .A(_025_),
    .Y(_034_)
  );
  NOR _084_ (
    .A(_034_),
    .B(_032_),
    .Y(_035_)
  );
  NOR _085_ (
    .A(_035_),
    .B(_031_),
    .Y(_019_)
  );
  NOT _086_ (
    .A(_020_),
    .Y(_037_)
  );
  NOT _087_ (
    .A(_026_),
    .Y(_038_)
  );
  NOT _088_ (
    .A(_069_),
    .Y(_040_)
  );
  NAND _089_ (
    .A(_040_),
    .B(_038_),
    .Y(_041_)
  );
  NOR _090_ (
    .A(_041_),
    .B(_018_),
    .Y(_043_)
  );
  NOR _091_ (
    .A(_043_),
    .B(_017_),
    .Y(_044_)
  );
  NOT _092_ (
    .A(_044_),
    .Y(_045_)
  );
  NOR _093_ (
    .A(_045_),
    .B(_037_),
    .Y(_046_)
  );
  NOR _094_ (
    .A(_044_),
    .B(_020_),
    .Y(_047_)
  );
  NOR _095_ (
    .A(_047_),
    .B(_046_),
    .Y(_021_)
  );
  NOT _096_ (
    .A(_024_),
    .Y(_048_)
  );
  NAND _097_ (
    .A(_023_),
    .B(_032_),
    .Y(_049_)
  );
  NOR _098_ (
    .A(_049_),
    .B(_020_),
    .Y(_050_)
  );
  NOR _099_ (
    .A(_050_),
    .B(_017_),
    .Y(_051_)
  );
  NOT _100_ (
    .A(_051_),
    .Y(_052_)
  );
  NOR _101_ (
    .A(_052_),
    .B(_048_),
    .Y(_053_)
  );
  NOR _102_ (
    .A(_051_),
    .B(_024_),
    .Y(_054_)
  );
  NOR _103_ (
    .A(_054_),
    .B(_053_),
    .Y(_028_)
  );
  NOT _104_ (
    .A(_030_),
    .Y(_055_)
  );
  NOT _105_ (
    .A(_017_),
    .Y(_056_)
  );
  NAND _106_ (
    .A(_050_),
    .B(_048_),
    .Y(_057_)
  );
  NAND _107_ (
    .A(_057_),
    .B(_056_),
    .Y(_058_)
  );
  NOR _108_ (
    .A(_058_),
    .B(_055_),
    .Y(_060_)
  );
  NOT _109_ (
    .A(_058_),
    .Y(_061_)
  );
  NOR _110_ (
    .A(_061_),
    .B(_030_),
    .Y(_062_)
  );
  NOR _111_ (
    .A(_062_),
    .B(_060_),
    .Y(_033_)
  );
  NOT _112_ (
    .A(_036_),
    .Y(_063_)
  );
  NAND _113_ (
    .A(_043_),
    .B(_037_),
    .Y(_064_)
  );
  NOR _114_ (
    .A(_064_),
    .B(_024_),
    .Y(_065_)
  );
  NAND _115_ (
    .A(_065_),
    .B(_055_),
    .Y(_066_)
  );
  NAND _116_ (
    .A(_066_),
    .B(_056_),
    .Y(_067_)
  );
  NOR _117_ (
    .A(_067_),
    .B(_063_),
    .Y(_068_)
  );
  NOR _118_ (
    .A(_057_),
    .B(_030_),
    .Y(_070_)
  );
  NOR _119_ (
    .A(_070_),
    .B(_017_),
    .Y(_071_)
  );
  NOR _120_ (
    .A(_071_),
    .B(_036_),
    .Y(_072_)
  );
  NOR _121_ (
    .A(_072_),
    .B(_068_),
    .Y(_039_)
  );
  NOR _122_ (
    .A(_036_),
    .B(_017_),
    .Y(_073_)
  );
  NAND _123_ (
    .A(_073_),
    .B(_070_),
    .Y(_042_)
  );
  BUF _124_ (
    .A(_026_),
    .Y(_059_)
  );
  assign _017_ = a[7];
  assign _026_ = a[0];
  assign w[0] = _059_;
  assign _069_ = a[1];
  assign w[1] = _074_;
  assign _018_ = a[2];
  assign w[2] = _019_;
  assign _020_ = a[3];
  assign w[3] = _021_;
  assign _024_ = a[4];
  assign w[4] = _028_;
  assign _030_ = a[5];
  assign w[5] = _033_;
  assign _036_ = a[6];
  assign w[6] = _039_;
  assign w[7] = _042_;
endmodule
