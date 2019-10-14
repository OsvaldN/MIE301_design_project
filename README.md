# MIE301_design_project
Design of walking mechanism for MIE301: Kinematic &amp; Dynamics of Machinery at UofT
<!----- Conversion time: 18.103 seconds.


Using this Markdown file:

1. Cut and paste this output into your source file.
2. See the notes and action items below regarding this conversion run.
3. Check the rendered output (headings, lists, code blocks, tables) for proper
   formatting and use a linkchecker before you publish this page.

Conversion notes:

* Docs to Markdown version 1.0β17
* Mon Oct 14 2019 08:29:07 GMT-0700 (PDT)
* Source doc: https://docs.google.com/open?id=1gyxvqvVeipcydpP80d9ItXYaTEcjtmukjH7ERmNrydU

WARNING:
You have some equations: look for ">>>>>  gd2md-html alert:  equation..." in output.

* This document has images: check for >>>>>  gd2md-html alert:  inline image link in generated source and store images to your server.
----->


<p style="color: red; font-weight: bold">>>>>>  gd2md-html alert:  ERRORs: 0; WARNINGs: 1; ALERTS: 11.</p>
<ul style="color: red; font-weight: bold"><li>See top comment block for details on ERRORs and WARNINGs. <li>In the converted Markdown or HTML, search for inline alerts that start with >>>>>  gd2md-html alert:  for specific instances that need correction.</ul>

<p style="color: red; font-weight: bold">Links to alert messages:</p><a href="#gdcalert1">alert1</a>
<a href="#gdcalert2">alert2</a>
<a href="#gdcalert3">alert3</a>
<a href="#gdcalert4">alert4</a>
<a href="#gdcalert5">alert5</a>
<a href="#gdcalert6">alert6</a>
<a href="#gdcalert7">alert7</a>
<a href="#gdcalert8">alert8</a>
<a href="#gdcalert9">alert9</a>
<a href="#gdcalert10">alert10</a>
<a href="#gdcalert11">alert11</a>

<p style="color: red; font-weight: bold">>>>>> PLEASE check and correct alert issues and delete this message and the inline alerts.<hr></p>


**DEPARTMENT OF MECHANICAL AND INDUSTRIAL ENGINEERING, UNIVERSITY OF TORONTO**

Walking Robot that Carries Large Dog

** **

MIE 301: Final Design Report

Dec. 5th, 2018

<span style="text-decoration:underline;">Group 19 - Diller Dynamics</span>

Daniel McInnis - 100 212 0581 (mcinni13)

Anh Kiet Nguyen - 100 290 1210 (nguy1699) 

Talha Javed - 100 241 1945  (javedtal)                               

Kevin Han - 100 348 8870 (hansan16)

Osvald Nitski - 100 245 6987 (nitskios)


## **Table of Contents **


[TOC]



## **2.0 Introduction **

Walking robots in _Diller Dynamics’_ old product line utilize a single electric motor to convert continuous rotational input into linear horizontal output through the curvilinear oscillating motion of linkages. The client has requested a version of the old walking robot design with modifications to carry their pet while it naps. It needs to have a smooth riding profile, meaning rapid changes in motion of the platform is to be minimized. A new version was developed incorporating changes to the walking mechanism to improve walking stability and the addition of a platform for the pet to be carried by. The following functions, objectives, and constraints were considered in the redesign to meet the client’s needs: 


### **2.1 Function**



*   Move linearly (forward/backward) while carrying dog


### **2.2 Objectives**



*   Move at a constant horizontal velocity (**0.5 m/s**)
*   Minimize platform tilt angle (maximum **±0.5°** tilt or **1°** range)
*   Minimize vertical displacement of platform to at most **5%** of standing height 


### **2.3 Constraints**



*   Use single constant rotational input (mobility = 1)
*   Support 68 kg dog [3] (with 4X safety factor →  272 kg)
*   No moving parts should extend into the platform area
*   Minimum platform size: 1.53 m by 0.92 m
    *   This is to accommodate a large dog size [3]

This report outlines problems with the old design of the walking robot, and also proposes a design for a new robot product that implements changes to meet the client’s requirements. Models of the existing and improved walking mechanisms used in these robots were created in MATLAB to analyze features of the motion that are of interest to the client. Each feature was analyzed under one revolution of the leg-driving input for each mechanism. Four parameters of the walking cycle were examined: 



1. **Forward-Backward Platform Tilt**

Constant tilting of the platform would be a disturbance to the passenger. Tilt is calculated as an angle using the slope of the straight line connecting the front and back ground-contacting feet when the platform is fixed horizontally. Side to side tilt is inherently negligible due to the symmetry of the system.



2. **Platform Height **

The platform height should be constant during motion for the best riding experience. The total height change of the platform throughout the walking cycle is calculated by plotting the height from the centre of the platform to the ground over a single cycle. Since the total height change depends on the absolute size of the mechanisms the plots have been normalized so that maximum height is equal to 1.



3. **Platform Vertical Acceleration **

Platform acceleration results in uncomfortable forces that are experienced by the passenger; making it undesirable. The ideal motion profile of a robot for the best riding experience would have zero acceleration; to eliminate the forces experienced by the passenger. 



4. **Platform Forward Horizontal Velocity **

Having a constant forward speed is a key component to an enjoyable ride. It ensures that there are no accelerations in the horizontal motion plane causing the passenger to experience uncomfortable forces. 

These four motion parameters were examined using kinematic analysis techniques and compared between the old design and the proposed one to show that the proposed design is an improvement.


## **3.0 Old Design  **


### **3.1 Old Design Description  **

The old design utilizes a Klann walking mechanism for the forward motion. It has planar legs that allow it to walk in a bidirectional straight path at variable speeds. A figure of the walking mechanism is shown at different points of the motion cycle in Figure 1. The platform did not meet sizing requirements, as per the client’s request on this design. The motion profile of the robot also did not meet client requirements. As a result, a new robot design was developed to meet client requirements.


### **3.2 Kinematic Analysis of Old Design **

The motion of the old robot design was analyzed to compare it to the proposed design. In particular, the 4 motion parameters mentioned in the introduction were examined for the old design. Comparison plots of these parameters were generated from the MATLAB model and can be found in section **4.2**; these plots were used to determine to following values.

**Table 1.0: Motion Parameters examined for Old Design **


<table>
  <tr>
   <td><strong>Platform Tilt </strong>
   </td>
   <td><strong>Platform Vertical Height Change </strong>
   </td>
   <td><strong>Platform Vertical Acceleration </strong>
   </td>
   <td><strong>Platform Horizontal Velocity </strong>
   </td>
  </tr>
  <tr>
   <td>Range of ~<strong>5.6°</strong>
   </td>
   <td>Change of approximately <strong>3.2 cm </strong>in height over a single rotation cycle (or approximately 8% of average height off the ground)
   </td>
   <td>Maximum vertical upward acceleration of ~ <strong>6.9 m/s<sup>2</sup></strong>
   </td>
   <td>Approximate amplitude of velocity profile over a single revolution is <strong>62.51</strong> cm/s  
   </td>
  </tr>
</table>



### **3.3 Issues with the Old Design **

As seen from Table 1.0, these motion parameters are not representative of a stable platform. They do not meet the requirements based on the functions, objectives and constraints set from the client’s request. In addition, the old design’s platform was not adequately sized for the client’s dog, so it would not meet the basic requirement of carrying a pet. The old design also has the walking mechanism legs exposed, which extend out. This is potentially dangerous as the mechanism input links have a larger region that can get caught in regular household items such as power cords and damage or limit the motion of the robot. Table 2 below lists other issues with the old design; in particular looking at the 4 motion parameters. 

**Table 2.0: Issues with motion of Old Design**


<table>
  <tr>
   <td><strong>Platform Tilt </strong>
   </td>
   <td>Tilting range of of <strong>5.6°</strong>
<ul>

<li><strong>>1°</strong> range set in the objectives
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong>Platform Vertical Height Change </strong>
   </td>
   <td>Change of ~ <strong>8%</strong> over a motion cycle
<ul>

<li> <strong>>5%</strong> limit set in objectives.
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong>Platform Vertical Acceleration </strong>
   </td>
   <td>Large upward maximum acceleration of <strong>6.9m/s<sup>2  </sup></strong>
   </td>
  </tr>
  <tr>
   <td><strong>Platform Horizontal Velocity </strong>
   </td>
   <td>Velocity profile has amplitude of ~ <strong>62.51 cm/s</strong>. 
<ul>

<li>Large fluctuations during motion causing unpleasant horizontal jerks for passenger
</li>
</ul>
   </td>
  </tr>
</table>


The platform has large accelerations, velocity amplitude, and tilt resulting in a rough riding profile. This design would not meet the client’s requirements for a smooth ride profile for their dog.  


## **4.0 Proposed Design**


### **4.1 Proposed Design Description**

_Diller Dynamics_ has identified various areas of improvements that achieves the aforementioned objectives more effectively. These improvements have culminated in the proposed design presented in this section. A MATLAB model of the proposed design was developed and optimized for kinematic analysis. A CAD model was also created in Solidworks to check for collisions in 3D and to validate the motion transmission system. 

    _Figure 2: High-Level View of Proposed Robot Design	_          _Figure 3: Kinematic model of mechanism_

 Significant changes have been made in the following areas of the newly-proposed design: 

**Table 3.0 Design Changes **


<table>
  <tr>
   <td><strong>Linkage improvement</strong>
   </td>
   <td>
<ul>

<li>Change from Klann → Theo-Jansen mechanism (shown in figure 3 above)  to achieve steady motion: lower vertical and horizontal variation [4]
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong>New short-toe foot design</strong>
   </td>
   <td>
<ul>

<li>Larger surface area and radius that come in contact with ground to improve load transfer

<li>Soft rubber coating provides better traction, minimizing slip potential
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong>Motion transmission system</strong>
<p>
<strong>(See figure 3)</strong>
   </td>
   <td>
<ul>

<li>A set of gears with a ratio of 2:1 is used between the input motor and centre axle shaft to provide a speed reduction

<li>The centre shaft extends to the sides of the robot through bearings and contained two sprockets on each side

<li>One of these two center sprockets on each side then connects to the front leg sprocket and the other to the back leg sprocket with a speed ratio of 5:1 to reduce the rotational speed and achieve the desired linear speed of the robot platform of 0.5 m/s
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong> Motion transmission Parts </strong>
   </td>
   <td>
<ul>

<li>Power/speed of the DC variable motor chosen was 1000W and ~2000 rpm 

<li>A 12V car battery is used, based on an electric bike that can carry adult human weight 

<li>Gears, sprockets, and bearings are all industry-standard parts that can be easily acquired
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong>Strategic placement of components</strong>
   </td>
   <td>
<ul>

<li>The overall design layout is focused on symmetry and evenly balanced positions in order to disperse equal amounts of weight and stresses between the four leg sets.
</li>
</ul>
   </td>
  </tr>
  <tr>
   <td><strong>Design of crankshaft and 3-leg module</strong>
   </td>
   <td>
<ul>

<li>The locations of the leg zones are spread to the extreme corners of the platform to prevent the robot tipping over

<li>Each leg zone contains 3 legs (12 total) to ensure that at least 1 leg remains on the ground during motion per zone (Figure 5 and Figure 6)

<li>The legs are driven from a custom designed crankshaft that serves as an input link to all 3 legs (Figure 5)

<li>A cover prevents the links and crankshaft from being exposed; reducing the chances of the moving parts getting damaged and also acting as a protective layer for passenger. This cover, the crankshaft and 3 leg mechanisms form a 3-leg module. 
</li>
</ul>
   </td>
  </tr>
</table>




<p id="gdcalert1" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report0.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert2">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report0.png "image_tooltip")


<p id="gdcalert2" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report1.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert3">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report1.png "image_tooltip")


  _            Figure 5: Module Consisting of 3 Legs	        Figure 6: Leg Module Locations and Foot Design_


### **4.2 Kinematic Analysis of Proposed Design** 

The analysis for the proposed design utilized methods identical to those for the old design analysis. The results for the four motion parameters of interest are summarized in Table 4.0 which can be contrasted with the results from the old mechanism seen in Table 1.0.

**Table 4.0: Motion Parameters Examined for Proposed Design **


<table>
  <tr>
   <td><strong>Platform Tilt </strong>
   </td>
   <td><strong>Platform Vertical Height Change </strong>
   </td>
   <td><strong>Platform Vertical Acceleration </strong>
   </td>
   <td><strong>Platform Horizontal Velocity </strong>
   </td>
  </tr>
  <tr>
   <td>Range of ~<strong>0.2°</strong>
   </td>
   <td>Change of 1 cm in height over a single rotation cycle (or approximately<strong> 2.5%</strong> of average height off the ground)
   </td>
   <td>Maximum upward acceleration of approximately <strong>0.7m/s<sup>2</sup></strong>
   </td>
   <td>Approximate amplitude of velocity profile over single revolution is  <strong>2.95 cm/s</strong> 
   </td>
  </tr>
</table>


The plots of the motion parameters modeled in MATLAB are shown below comparing the old and the new mechanism. As shown, the motion profile of the proposed Theo-Jansen mechanism is much smoother than the old Klann mechanism.



<p id="gdcalert3" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report2.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert4">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report2.png "image_tooltip")


**Motor selection and transmission system**

Force analysis was performed to find the minimum required torque for robot movement. A subsystem approach was used (see Figure 7 and 8) to reduce the number of unknowns. As the mass of the platform, dog (with safety factor) and drivetrain are significant, the weight of the legs was assumed to be negligible (static force analysis). Vertical upwards acceleration peaks at 0.7 m/s<sup>2 </sup>(refer to vertical acceleration graph), providing an inertial force 14X less than the gravitational force from the weight of the core (drivetrain, dog, platform) of the robot used in the static analysis. During the very short periods when ground contact is exchanged between legs one side of the walker drops with gravitational acceleration and does not actually experience any force during the fall.



<p id="gdcalert4" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report3.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert5">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report3.png "image_tooltip")
    		

<p id="gdcalert5" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report4.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert6">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report4.png "image_tooltip")


_Figure 7: FBD and Force Polygon for Start of Step             Figure 8: FBD and Force Polygon for Start of Step_

The start and end of the linear propelling path are depicted in Figure 7 and 8 respectively. Figure 7 shows that the foot starts its step at an input link angle of 282.95° and ends its linear propelling path (before lifting off the ground) at an input angle of 42.95°. The force F<sub>A</sub> is found by dividing the motor torque by the length of the input link, while F<sub>F</sub> is the frictional force and F<sub>N</sub> is the normal force from the ground. For the force of friction, 

<p id="gdcalert6" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: equation: use MathJax/LaTeX if your publishing platform supports it. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert7">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>

, with 

<p id="gdcalert7" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: equation: use MathJax/LaTeX if your publishing platform supports it. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert8">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>

=0.7 for rubber on concrete [5].

The MATLAB model was used to show that an output crankshaft angular speed of approximately 50 rpm is needed to move the robot forward at 0.5 m/s. A 1:10 (output:input) speed ratio is created using the gear and timing belt ratios in the drivetrain which also creates a 10:1 torque ratio. A constant 500 rpm motor input speed is needed for typical operation, so a motor capable of up to 2000 rpm and 1000 W was selected. The motor shaft torque is 19 Nm - the below calculations show the drivetrains effect:

P = Tw = 1000W [6] & w= 500rpm*2pi/60=52.4 rad/s → T=1000W/52.4 = 19 Nm (motor output torque) 

T<sub>crankshaft</sub> = 19Nm * 10 (torque ratio) = 190 Nm (torque at crankshaft, i.e. the leg input)



<p id="gdcalert8" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report5.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert9">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report5.png "image_tooltip")



<table>
  <tr>
   <td><strong>Input Angle (θ)</strong>
   </td>
   <td><strong><span style="text-decoration:underline;">282.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">297.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">312.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">327.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">342.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">357.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">12.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">27.95</span></strong>
   </td>
   <td><strong><span style="text-decoration:underline;">42.95</span></strong>
   </td>
  </tr>
  <tr>
   <td><strong>Torque (Nm)</strong>
   </td>
   <td>50.701
   </td>
   <td><strong>63.527</strong>
   </td>
   <td>48.635
   </td>
   <td>39.963
   </td>
   <td>34.695
   </td>
   <td>31.544
   </td>
   <td>29.835
   </td>
   <td>31.434
   </td>
   <td>34.502
   </td>
  </tr>
</table>


A Microsoft Excel spreadsheet was used to calculate the required torque for each given input angle above. The beginning of the step (282.95°), the end of the step (42.95°) and intermediary positions with an increment of 15° were analyzed to find the maximum torque needed while the foot is on the ground. It was found to be 63.527 Nm - well below the 190 Nm that was being supplied by the crankshaft.

**4.3 How the Proposed Design is an Improvement**

The proposed design introduces a larger carrier platform with adequate size to carry a passenger (client’s dog). The old design’s platform was not adequately sized for the client’s dog. The proposed design is safer as the moving parts (mechanism walking legs, input crankshaft, motion transmission system, etc.) are covered using a side cover. This mitigates any potential jamming of the drivetrain by external items which the previous design was susceptible to. Moreover, by replacing the Klann mechanism with the Theo-Jansen mechanism, the motion profile is smoother as proven above. 

**Table 5.0: Comparison of Proposed and Old Design **


<table>
  <tr>
   <td><strong>Design Parameter</strong>
   </td>
   <td><strong>Old </strong>
   </td>
   <td><strong>Proposed </strong>
   </td>
   <td><strong>Improvement</strong>
   </td>
  </tr>
  <tr>
   <td><strong>Platform Tilt </strong>
<ul>

<li>Maximum Range of 1° set
</li>
</ul>
   </td>
   <td>Platform tilts with range of 5.6°
   </td>
   <td>Platform tilts with range of 0.2°
   </td>
   <td>5.4° tilt range reduction
   </td>
  </tr>
  <tr>
   <td><strong>Platform Vertical Height Change</strong>
<ul>

<li>Maximum change of 5% of standing height set <strong> </strong>
</li>
</ul>
   </td>
   <td>Platform vertical height change of approximately 8% (3.2cm) over a single motion cycle
   </td>
   <td>Platform vertical height change of approximately 2.5% (1cm) over a single motion cycle 
   </td>
   <td>2.2cm reduction in vertical displacement over motion cycle 
   </td>
  </tr>
  <tr>
   <td><strong>Platform Vertical Acceleration </strong>
<ul>

<li>Vertical acceleration minimized to prevent upward jerk force on the passenger during motion 
</li>
</ul>
   </td>
   <td>Maximum upward vertical acceleration of approximately 6.9 m/s<sup>2</sup>
   </td>
   <td>Maximum upward vertical acceleration of approximately 0.7 m/s<sup>2</sup>
   </td>
   <td>Approximately 10x reduction of acceleration by 6.2m/s<sup>2</sup>
   </td>
  </tr>
  <tr>
   <td><strong>Platform Horizontal Velocity</strong>
<ul>

<li>Constant velocity of 0.5 m/s set in objectives <strong> </strong>

<li>Lower velocity profile amplitude is an indicator of constant horizontal velocity
</li>
</ul>
   </td>
   <td>Velocity profile over a single rotation has amplitude of approximately 0.6251m/s (large fluctuations around 50 cm/s)
   </td>
   <td>Velocity profile over a single rotation has amplitude of approximately 0.0295m/s (small fluctuations around 50 cm/s) 
   </td>
   <td>Approximately 21x reduction in amplitude of velocity profile for single motion cycle; more consistent horizontal motion for smoother riding experience  
   </td>
  </tr>
</table>


**4.4 Limitations of the Proposed Design **

The proposed design, although superior than the old mechanism, is not without its own limitations and drawbacks. Some of these limitations include:



*   At 1.92m wide, this robot can only move around in large open rooms or outdoors - it will not be able to navigate through tight spaces, or through standard-sized single-doors
*   It can only travel in a straight line - it will not be able to navigate around an obstacle in its path
*   It has not been analyzed for its ability to go up or down stairs
*   It is heavy - excluding the legs, it has an unloaded mass of 64.24 kg - therefore it will be difficult to reorient the robot as it is not capable of turning itself

Although outside of the scope of the agreed upon design objectives and requirements, some design changes that could be implemented should the client be willing to re-visit budget and delivery time are:



*   A clutch could be included for the purpose of releasing the leg’s crankshaft on one side of the robot from the rest of the drivetrain. This could be released when the robot needs to turn, so that only one side is being driven. This would generate a pivoting maneuver to get around an obstacle.
*   A modular frame could replace the large frame that the dog sits on, so that it could split into 2 or 3 pieces to be carried through doors easily (if the house does not have double or sliding doors).
*   A seatbelt or restraint system if the robot is going to be used on uneven terrain or staircases

**5.0 Conclusion **

The proposed design presented in this document meets the client requirements, and has been validated to meet the functions, objectives and constraints set by Diller Dynamics engineers. It incorporates a new walking mechanism, improved drivetrain, a properly-sized platform and an optimized foot design. Design decisions were made to maximize passenger comfort during motion.The proposed robot design has a smoother motion profile relative to the old design allowing the client’s dog to be carried around the house comfortably and safely.

**6.0 References** 


        [1]   _Robotshop.com_, 2011. [Online]. Available: [https://www.robotshop.com/community/robots/show/mech-spider-fail-arrrgh](https://www.robotshop.com/community/robots/show/mech-spider-fail-arrrgh).


        [2]   "Biomimetic Mover – Days 1 and 2 – Bray Laboratory", _Tufts University_, 2016. [Online]. Available: [https://sites.tufts.edu/bray/2016/06/16/biomimetic-mover-days-1-and-2/](https://sites.tufts.edu/bray/2016/06/16/biomimetic-mover-days-1-and-2/).


        [3]   "Choosing the Right Crate Size - APDT", _The Association of Professional Dog Trainers_, 2017. [Online]. Available: [https://apdt.com/resource-center/choosing-right-crate-size/](https://apdt.com/resource-center/choosing-right-crate-size/).


        [4]	P. McCarthy, "Comparison of Klann and Jansen leg linkages | Mechanical Design 101", _Mechanical Design 101_. [Online]. Available: [https://mechanicaldesign101.com/2009/07/07/comparison-of-klann-and-jansen-leg-linkages/](https://mechanicaldesign101.com/2009/07/07/comparison-of-klann-and-jansen-leg-linkages/). 


        [5]	"Friction and Friction Coefficients", _Engineeringtoolbox.com_, 2018. [Online]. Available: [https://www.engineeringtoolbox.com/friction-coefficients-d_778.html](https://www.engineeringtoolbox.com/friction-coefficients-d_778.html)  


        [6] 	"DC Motor Calculations: Calculating Torque | MICROMO", _Micromo.com_, 2018. [Online].      Available: [https://www.micromo.com/technical-library/dc-motor-tutorials/motor-calculations](https://www.micromo.com/technical-library/dc-motor-tutorials/motor-calculations).


    

<p id="gdcalert9" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report6.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert10">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report6.png "image_tooltip")




<p id="gdcalert10" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report7.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert11">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report7.png "image_tooltip")




<p id="gdcalert11" ><span style="color: red; font-weight: bold">>>>>>  gd2md-html alert: inline image link here (to images/Final-Report8.png). Store image on your image server and adjust path/filename if necessary. </span><br>(<a href="#">Back to top</a>)(<a href="#gdcalert12">Next alert</a>)<br><span style="color: red; font-weight: bold">>>>>> </span></p>


![alt_text](images/Final-Report8.png "image_tooltip")



<!-- Docs to Markdown version 1.0β17 -->
