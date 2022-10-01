import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Summarization extends StatelessWidget {
  Summarization({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/Space2.jpg',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    Text('Summary',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                     height: 20,
           ),
                    Text('We quantified the C consequences of chronic water stress using a 13-year record of tree growth (n = 200 trees), soil moisture, and ecosystem C balance at the Morgan–Monroe State Forest (MMSF) in Indiana, and a regional 11-year record of tree growth (n > 300 000 trees) and water availability for the 20 most dominant deciduous broadleaf tree species across the eastern and midwestern USA.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),


                    ),
                    SizedBox(
                     height: 20,
           ),
                    Text('While forests may increase C uptake owing to rising temperatures and trends in phenology (Richardson et al., 2009; Dragoni et al., 2011), atmospheric CO2 enrichment (Norby et al., 2005), and nutrient availability (Melillo et al., 2002; Thomas et al., 2010), such gains in C will only be realized if soil moisture is sufficient to sustain photosynthesis and growth (Anderegg et al., 2012; Choat et A few severe drought events (e.g., Europe 2003; Ciais et al., 2005) have permitted an analysis of the response of forest C cycling to discrete drought events; however, most changes in the regional and global hydrological cycles will occur gradually over long time scales (Sheffield et al., 2012) and as such, the effects of mild water stress on forest C balance represent a key knowledge gap (Gerten et al., 2008). al., 2000), an occurrence that could shift ecosystems from C sinks to sources owing to drought-induced tree mortality (Breshears et al., 2005; Allen et al., 2010; Anderegg et al., 2012)',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                      ),


                    ),
                  ],
                ),
              ),
            )
          ]),
    );
  }
}

