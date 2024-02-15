# CudaMONSEL
CudaMONSEL is a full-fledged electron tracker based on first physical principles. Its primary application is to carry out Monte Carlo simulation of SEM Signals. It can be ran on CPUs using a thread pool, as well as GPUs using the CUDA framework for increased computational efficiency. 

<p float="left" align="center">
  <img src="/docs/imgs/BSE0.png" width="30%" />
  <img src="/docs/imgs/GT0.png" width="30%" /> 
</p>

CudaMONSEL is a direct port of [JMONSEL](https://www.nist.gov/programs-projects/scanning-electron-microscopy); the original Java version of the model developed by [J.S. Villarrubia](https://www.nist.gov/people/john-s-villarrubia) and [Nicholas Ritchie](https://www.nist.gov/people/nicholas-ritchie) of NIST. CudaMONSEL aims to speed up the original simulation with native code & mass produce SEM images for ML training. It also includes extra functionalities to describe the geometry of the simulation target. For example, 2D projections of the outline of shapes on an arbitrary plane.<br/>

## Citing CudaMONSEL
If you use CudaMONSEL in your research, please cite with:
```
@misc{villarrubia2015jmonsel,
  title={Scanning electron microscope measurement of width and shape of 10 nm patterned lines using a JMONSEL-modeled library},
  author={J.S. Villarrubia et. al.},
  howpublished={\url{https://ws680.nist.gov/publication/get_pdf.cfm?pub_id=916512}},
  year={2015}
}

@misc{zeng2019cudamonsel,
  title={CudaMONSEL},
  author={Ruizi, Zeng},
  howpublished={\url{https://github.com/zengrz/CudaMONSEL/}},
  year={2019}
}
```

## Citing Amphibian
Amphibian is an initiative to build a library of data structures and algorithms that can be used on both host and device. Can be useful when transitioning from CPU to CUDA code.
```
@misc{zeng2019amphibian,
  title={Amphibian},
  author={Zeng, Ruizi},
  howpublished={\url{https://github.com/zengrz/Amphibian/}},
  year={2019}
}
```

## Project Provenance
CudaMONSEL appears to have had an *interesting* history, the [original author](https://www.researchgate.net/profile/R-Zeng-2) took down the repo and has since posted the following response in an [issue](https://github.com/zengrz/Amphibian/issues/1#issuecomment-639801841) within a repository for the Amphibian dependency. Odd situation, but fortunately the repo was forked before any of this took place. Some additional insight into CudaMONSEL's original objectives and design choices can be found in the (*unfortunately incomplete*) [whitepaper](/docs/report.pdf). 
<p align="center">
  <img src="/docs/imgs/ODD.png" width="72%" />
</p>

## Alternative Simulators
> [!TIP]
> The most promising replacement I have found thus far is [Nebula](https://nebula-simulator.github.io/); an open-source simulator of electron-matter interaction published by L. van Kessel and C.W. Hagen of [TU Delft's ImPhys](https://repository.tudelft.nl/islandora/object/uuid%3Ad5740b54-6c37-4598-af70-67268d71696e) (Microscopy Instrumentation & Techniques) department. Their [paper](https://doi.org/10.1016/j.softx.2020.100605) shows simulation of SE & BSE signals and importantly it remains based on first-principle physical models. If that wasn't enough to convince you it's apparently *"used within ASML to obtain a better understanding of SEM signal formation"* according to an old PhD position [listing](https://www.searchaphd.com/job/phd-position-simulation-of-scanning-electron-microscope-sem-images-of-semiconductor-devices/6840) 👀...

---

Since 2019, further open-source[^1] C++/CUDA backed Monte Carlo simulations tailored to modeling electron scattering & secondary electron generation were published. If you happen to stumble upon this repo I'd recommend first exploring some solutions listed in the table[^2] below.

<div align="center">
<table class="tg">
<thead>
  <tr>
    <th>Name</th>
    <th>Open<br>Source</th>
    <th>Bulk</th>
    <th>Layers</th>
    <th>GUI</th>
    <th>Complex<br>Samples</th>
    <th>X-Ray<br>Spectra</th>
    <th>Programmable</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td><a href="https://casino.espaceweb.usherbrooke.ca/">CASINO</a></td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️ - ver. 3</td>
    <td>❌</td>
    <td>✔️ - PyPI</td>
  </tr>
  <tr>
    <td><a href="https://www.memrg.com/programs-download">Win X-Ray</a></td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://www.memrg.com/programs-download">MC X-Ray</a></td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://github.com/usnistgov/EPQ/tree/master/src/gov/nist/microanalysis/NISTMonte">NISTMonte</a></td>
    <td>✔️ - Java</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
  </tr>
  <tr>
    <td><a href="https://pypenelope.sourceforge.net/">Penelope</a></td>
    <td>✔️ - Fortran</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
  </tr>
  <tr>
    <td><a href="https://web.archive.org/web/20200603173129/https://web.utk.edu/~srcutk/htm/simulati.htm">LMS-MC</a></td>
    <td>✔️ - Fortran</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://doi.org/10.6028/NBS.SP.460">NBSMonte</a></td>
    <td>✔️ - Fortran</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://www.2spi.com/item/09306-ab/">EFS</a></td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://www.mc-set.com/">MC-SET</a></td>
    <td>✔️ - C++</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
  </tr>
  <tr>
    <td><a href="https://doi.org/10.4121/21365268">MONCA2</a></td>
    <td>✔️ - Matlab</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
  </tr>
  <tr>
    <td><a href="https://doi.org/10.1017/S1431927603014065">MONCA</a></td>
    <td>✔️ - Matlab</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
    <td>✔️</td>
  </tr>
  <tr>
    <td><a href="http://dx.doi.org/10.1016/j.phpro.2008.07.110">CHARIOT</a></td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://github.com/Geant4/geant4">GEANT4</a></td>
    <td>✔️ - C++</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
  </tr>
  <tr>
    <td><a href="https://www.semanticscholar.org/paper/EISS-Electron-beam-Monte-Carlo-simulator-Bausells/b0e23245b316b9be08e11b173f601e5655cea900">EISS</a></td>
    <td>✔️ - Java</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>❌</td>
    <td>❌</td>
  </tr>
  <tr>
    <td><a href="https://www.ptb.de/cms/en/ptb/fachabteilungen/abt5/fb-52/ag-524/neuentwicklung524.html">MCSEM</a></td>
    <td>✔️ - C++</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>✔️</td>
    <td>❌</td>
    <td>✔️</td>
  </tr>
</tbody>
</table>
</div>
<br/>

[^1]: Unfortunately, without direct ties to academia some tend to be "open-source" on paper only & are quite hard to obtain.
[^2]: Table transcribed from [Radim Skoupý](https://scholar.google.com/citations?user=JueRbfUAAAAJ)'s doctoral thesis on "[Quantitative imaging in scanning electron microscope](https://www.vut.cz/www_base/zav_prace_soubor_verejne.php?file_id=217891#page=34)"