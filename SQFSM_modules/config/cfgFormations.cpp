class cfgFormations
       {
       class West
               {
               class formColumnFixed
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,0};
                               FormationPositionInfo2[]={0,0,-1,"0.78539816339744830961f"};
                               FormationPositionInfo3[]={1,0,-1,"-0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,0,-1,"3.14159265358979323846f"};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-1,0,-1,0};
                               FormationPositionInfo2[]={0,0,-1,"0.78539816339744830961f"};
                               FormationPositionInfo3[]={1,0,-1,"-0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,0,-1,"3.14159265358979323846f"};
                               };

                       };

               class Staggered
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1, 0, 0, 0};
                               FormationPositionInfo2[]={0,  2,1,  "0.78539816339744830961f"};
                               FormationPositionInfo3[]={1, -2,1,  "-0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,  2,1,  "3.14159265358979323846f"};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-1, -2,1,   0};
                               FormationPositionInfo2[]={0,   2,1,   "0.78539816339744830961f"};
                               FormationPositionInfo3[]={1,  -2,1,   "-0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,   2,1,   "3.14159265358979323846f"};
                               };

                       };

               class Wedge
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,0};
                               FormationPositionInfo2[]={0,1,-1,"0.78539816339744830961f"};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-2,-1,-1,"-0.78539816339744830961f"};
                               FormationPositionInfo2[]={-1,1,-1,"0.78539816339744830961f"};
                               };

                       };

               class EchelonLeft
                       {
                            #include "..\formations\mechFormationBack.cpp"
                    //    class Fixed
                    //            {
                    //            FormationPositionInfo1[]={-1,0,0,0};
                    //            FormationPositionInfo2[]={0,-1,-1,"-0.78539816339744830961f"};
                    //            FormationPositionInfo3[]={1,-1,-1,"-0.78539816339744830961f"};
                    //            FormationPositionInfo4[]={2,-1,-1,"-1.57079632679489661923f"};
                    //            };

                    //    class Pattern
                    //            {
                    //            FormationPositionInfo1[]={-1,-1,-1,0};
                    //            FormationPositionInfo2[]={0,-1,-1,"-0.78539816339744830961f"};
                    //            FormationPositionInfo3[]={1,-1,-1,"-0.78539816339744830961f"};
                    //            FormationPositionInfo4[]={2,-1,-1,"-1.57079632679489661923f"};
                    //            };

                       };

               class EcholonRight
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,0};
                               FormationPositionInfo2[]={0,1,-1,"0.78539816339744830961f"};
                               FormationPositionInfo3[]={1,1,-1,"0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,1,-1,"1.57079632679489661923f"};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-1,1,-1,0};
                               FormationPositionInfo2[]={0,1,-1,"0.78539816339744830961f"};
                               FormationPositionInfo3[]={1,1,-1,"0.78539816339744830961f"};
                               FormationPositionInfo4[]={2,1,-1,"1.57079632679489661923f"};
                               };

                       };

               class Vee
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,"-0.78539816339744830961f"};
                               FormationPositionInfo2[]={0,1,0,"0.78539816339744830961f"};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-2,-1,1,"-0.78539816339744830961f"};
                               FormationPositionInfo2[]={-1,1,1,"0.78539816339744830961f"};
                               };

                       };

               class Line
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,0};
                               FormationPositionInfo2[]={0,1,0,0};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-2,-1,0,0};
                               FormationPositionInfo2[]={-1,1,0,0};
                               };

                       };

               class Diamond
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,0};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-1,0.5,-0.5,"0.78539816339744830961f",0};
                               FormationPositionInfo2[]={0,-1,0,"-0.78539816339744830961f",0};
                               FormationPositionInfo3[]={1,0.5,-0.5,0,0};
                               };

                       };

               class File
                       {
                       class Fixed
                               {
                               FormationPositionInfo1[]={-1,0,0,0};
                               };

                       class Pattern
                               {
                               FormationPositionInfo1[]={-1,0,-0.5,"-0.78539816339744830961f",0};
                               FormationPositionInfo2[]={0,0,-0.5,"0.78539816339744830961f",0};
                               };

                       };

               };

       class East : West
               {
               class formColumnFixed : formColumnFixed {};
               class Staggered : Staggered {};
               class Wedge : Wedge {};
               class EchelonLeft : EchelonLeft {};
               class EcholonRight : EcholonRight {};
               class Vee : Vee {};
               class Line : Line {};
               class Diamond : Diamond {};
               class File : File {};
               };

       class Guer : West
               {
               class formColumnFixed : formColumnFixed {};
               class Staggered : Staggered {};
               class Wedge : Wedge {};
               class EchelonLeft : EchelonLeft {};
               class EcholonRight : EcholonRight {};
               class Vee : Vee {};
               class Line : Line {};
               class Diamond : Diamond {};
               class File : File {};
               };

       class Civ : West
               {
               class formColumnFixed : formColumnFixed {};
               class Staggered : Staggered {};
               class Wedge : Wedge {};
               class EchelonLeft : EchelonLeft {};
               class EcholonRight : EcholonRight {};
               class Vee : Vee {};
               class Line : Line {};
               class Diamond : Diamond {};
               class File : File {};
               };

       };