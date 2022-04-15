import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

final String title = "Privacy Policy";

class PrivacyPage extends StatefulWidget {
  PrivacyPage(title);
  @override
  _PrivacyPageState createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(left: 35, top: 25, right: 16, bottom: 20),
          child: Text(title),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 12),
                  new RichText(
                      text: new TextSpan(
                          style: new TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                          children: <TextSpan>[
                        new TextSpan(
                            text:
                                'By using and accessing the website having domain name www.fitpass.co.in and related software application for use on wireless computing devices such as smartphones and tablets and also for use on desktop or laptop computers under the name and style of “'),
                        new TextSpan(
                          text: 'FITPASS',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        new TextSpan(text: '” (hereinafter referred to as “'),
                        new TextSpan(
                          text: 'Electronic Media',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        new TextSpan(
                            text:
                                ' which is owned, operated and managed by the Company, You agree to be bound by the terms of this privacy policy (hereinafter referred to as “'),
                        new TextSpan(
                          text: 'Privacy Policy” or “Policy”',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        new TextSpan(text: '” or “'),
                        new TextSpan(
                          text: 'Policy',
                          style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        new TextSpan(text: '“).'),
                      ])),

                  SizedBox(height: 12),

                  new RichText(
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text:
                                  'For the purposes of this Policy, wherever the context so requires, references to the terms “'),
                          new TextSpan(
                            text: 'User(s)',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              '”, “'),
                          new TextSpan(
                            text: 'You',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              '” or “'),
                          new TextSpan(
                            text: 'Your',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),

                          new TextSpan(
                              text:
                              '”, shall mean and include the user, registered on the Electronic Media, who uses or access the Electronic Media or avails the Service(s) of the Electronic Media in accordance with the Terms of Use.The reference to the terms, “We”, “Us”, “Our”, or “Company” shall mean ASR Market Ventures Pvt. Ltd.'),

                        ]),
                  ),

                  SizedBox(height: 15),

                  new RichText(
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text:
                              'The Electronic Media offers and enables to the User certain online products, services and features on the Electronic Media (“'),
                          new TextSpan(
                            text: 'Services',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              '”), in accordance with the terms and conditions of use/Service of the Electronic Media, as available at https://fitpass.co.in/terms-and-conditions (“'),
                          new TextSpan(
                            text: 'Terms of Use',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              '”).'),


                        ]),
                  ),

                  SizedBox(height: 12),
                  Text(
                    "This Privacy Policy, inter alia, states the following:",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "         i. The type of information collected from the Users, including personal information (as defined below) and sensitive personal data or information (as defined below) relating to an individual; ",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "         ii. The purpose, means and modes of collection, usage, processing, retention and destruction of such information; and ",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "         iii. how and to whom We will disclose such information.",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),

                  //--------------------------------

                  Text(
                    "This Privacy Policy shall apply to any person who visits, browses, uses or accesses the Electronic Media or use any Services on the Electronic Media. This Privacy Policy is an electronic record in terms of the Information Technology Act, 2000, and rules made thereunder. Further, this electronic record is generated by a computersystem and does not require any physical or digital signatures. This Privacy Policy is published in compliance with section 43A of the Information Technology Act, 2000, regulation 4 of the Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Information) Rules, 2011 (the “SPI Rules”), regulation 3(1) of the Information Technology (Intermediaries’ Guidelines) Rules, 2011.Any new features and/or services that are added to Our current service at any point in the future shall also be subject to the terms set out in this Policy.",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),

                  new RichText(
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text:
                              'The term, “'),
                          new TextSpan(
                            text: 'personal information',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              '” is defined under the SPI Rules to mean any information that relates to a natural person, which, either directly or indirectly, in combination with other information available or likely to be available to a body corporate, is capable of identifying such person. The SPI Rules, further, define “'),
                          new TextSpan(
                            text: 'sensitive personal data or information',
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              '” of a person to mean personal information about that person relating to: (i) passwords; (ii) financial information such as bank accounts, credit and debit card details or other payment instrument details; (iii) physical, physiological and mental health condition; (iv) sexual orientation; (v) medical records and history; (vi) biometric information; (vii) information received by body corporate under lawful contract or otherwise; (viii) visitor details as provided at the time of registration or thereafter; and (ix) call data records. Note that any data/ information relating to an individual that is freely available or accessible in public domain or furnished under the Right to Information Act, 2005, or any other law shall not qualify as Sensitive Personal Data or Information.'),


                        ]),
                  ),





                  SizedBox(height: 12),
                  Text(
                    "In order to enable a User to have access to the features, benefits or Services on Our Electronic Media, the User may require to provide certain information on the Electronic Media which may constitute ‘personal information’ or ‘sensitive personal data or information’ of a person under the SPI Rules. As part of the registration process and/or in order to avail all the features, benefits or Services on the Electronic Media, We may collect the following categories of personal information from the User: User’s name, email address, gender,country, ZIP/postal code, age, phone number, location; and, in addition, at the time of the registration process and/or in order to avail all the features, benefits or Services of the Electronic Media, the User may also be required to provide certain sensitive personal data or information, including bank account/card details or card information of the User or such other information as may be required for the purposes of availing the Services of the Electronic Media. We may, in future, include other optional requests for information from the User to help Us to customize the Electronic Media to deliver personalized information to the User.",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),

                  new RichText(
                    text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text:
                              'DISCLAIMER-',

                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          new TextSpan(
                              text:
                              'BY USING AND ACCESSING THE ELECTRONIC MEDIA AND BY AVAILING THE SERVICES OR BY OTHERWISE GIVING US YOUR INFORMATION, YOU WILL BE DEEMED TO HAVE READ, UNDERSTOOD AND AGREED TO THE PRACTICES AND POLICIES OUTLINED IN THIS PRIVACY POLICY AND AGREE TO BE BOUND BY THIS PRIVACY POLICY. YOU HEREBY CONSENT TO OUR COLLECTION, USE AND SHARING, DISCLOSURE OF YOUR INFORMATION AS DESCRIBED IN THIS PRIVACY POLICY. WE RESERVE THE RIGHT TO CHANGE, MODIFY, ADD OR DELETE PORTIONS OF THE TERMS OF THIS PRIVACY POLICY, AT OUR SOLE DISCRETION, AT ANY TIME. IF YOU USE THE SERVICES ON BEHALF OF OR FOR THE BENEFIT OF SOMEONE ELSE OR ANY ENTITY YOU REPRESENT THAT YOU ARE AUTHORIZED BY SUCH INDIVIDUAL OR ENTITY TO (I) ACCEPT THIS PRIVACY POLICY ON SUCH INDIVIDUAL’S OR ENTITY’S BEHALF, AND (II) CONSENT ON BEHALF OF SUCH INDIVIDUAL OR ENTITY TO OUR COLLECTION, USE AND DISCLOSURE OF SUCH INDIVIDUAL’S OR ENTITY’S INFORMATION. BY VISITING THE ELECTRONIC MEDIA, YOU AGREE TO BE BOUND BY THE TERMS AND CONDITIONS OF THIS PRIVACY POLICY. IF YOU DO NOT AGREE WITH THE TERMS CONTAINED HEREIN, PLEASE DO NOT USE OR ACCESS OUR ELECTRONIC MEDIA OR AVAIL ANY SERVICES ON THE ELECTRONIC MEDIA. BY MERE USE OF THE ELECTRONIC MEDIA, YOU EXPRESSLY CONSENT TO OUR USE AND DISCLOSURE OF YOUR PERSONAL INFORMATION IN ACCORDANCE WITH THIS PRIVACY POLICY.'),

                        ]),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "PURPOSE OF THIS PRIVACY POLICY",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),

                  SizedBox(height: 12),
                  Text(
                    "We respect your need to understand how and why information is being collected, used, disclosed, transferred and stored. Thus, We have developed this Policy to familiarize You with Our practices and demonstrate Our commitment to the protection of Your privacy and Your personal information. This Privacy Policy sets out the way in which We process Your information when You visit the Electronic Media or use the Services in accordance with applicable data protection laws. By accessing Our Electronic Media or availing the Services, You agree to be bound by the terms of this Policy. It is important that You read this Policy together with any other policies We may provide on specific occasions when We are collecting or processing your personal data, so that You are fully aware of how and why We are using your personal data. This Policy supplements the other notices and is not intended to override them.",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "The information contained on this Electronic Media and the personal information collected by using/ login and or accessing this Electronic Media are stored at a secured server. It is stated by the server service provider that they have all the best security practices required for the server. The Electronic Media is owned by Us and is located in India. Hence, We are bound by duty to abide by the laws, including but not limited to, regulations, rules, circulars and notifications governing privacy in India.",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "SCOPE OF THIS PRIVACY POLICY",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We provide this Privacy Policy to inform You of Our policies and procedures regarding collection, storage, and processing and sharing of personal data that We receive from Users of the Electronic Media or those with are stored or accessed by Us at the time of availing the Services or making transactions on the Electronic Media.With regard to this Privacy Policy, the terms "using" and "processing" information include, without limitation; the use of cookies; and the collection, storage, transfer, evaluation, deletion, disclosure, management, handling, modifying and use of personal data.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'This Privacy Policy applies only to personal data that You provide Us via the Electronic Media. We reserve the right to update this Privacy Policy from time to time to reflect any changes to Our Services. We will do this by amending the Privacy Policy on the Electronic Media. The changes will take effect automatically, as soon as they are posted on the Electronic Media. In addition, We will notify all users by email if any material changes are made to the Policy, subject to the Users’ acceptance to receive emails from Us.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'This Privacy Policy is applicable to all Users of this Electronic Media. By using the Services, registering with Us or by otherwise giving Us Your information, You will be deemed to have read, understood and agreed to the practices and policies outlined in this Privacy Policy and agree to be bound by the terms hereof. You hereby consent to Us collecting, using and sharing and disclosing Your information as described in this Privacy Policy. We reserve the right to change, modify, add or delete portions of the terms of this Privacy Policy, at Our sole discretion, at any time. If You do not agree with this Privacy Policy at any time, do not use any of the services, use or access the Electronic Media or give Us any of Your information. Any User that does not agree with any provisions of the Privacy Policy has the option to discontinue the Services provided by Us immediately.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'This Privacy Policy does not apply to any third-party website(s) and mobile app(s). You are requested to take note that information and privacy practices of Our business partners, advertisers, sponsors or other sites to which We provide hyperlink(s), may be different from this Policy, Hence, it is recommended that You review the Privacy Policy of any such third parties before You interact with such interfaces',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "PROCESSING OF PERSONAL DATA",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We may process your personal data for, including without limitation, the following purposes:',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  SizedBox(height: 12),
                  Text(
                    'Providing Our services: We might process your personal data to provide Services so as to facilitate the interaction and transaction of the Users. For example, personal data is processed in order to set up your user account or facilitate you in availing and providing specialized services/products pertaining to personal development training. We process the following personal data: (i) name; (ii) phone number; (iii) email address; (iv) home address; (v) IP address; (vi) location; (vii) user account profile data.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),


                  SizedBox(height: 12),
                  Text(
                    'Customer service: We need to process personal data for this purpose because it enables Us to adequately respond to Users’ questions/ concerns and to verify the correctness of the order for the Services placed by User on the Electronic Media and to ensure the overall quality of the services availed by a User on the Electronic Media.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Marketing (Direct): We process Users’ data for (direct) marketing purposes. This means that We can contact customers to draw attention to Our services. For this purpose, We process the following personal data: (i) website/Electronic Media behaviour; (ii) IP address;(iii) email address; (iv) postal address; (v) phone number (vi) online identifiers; (vii) location; (viii) and account information.0',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Commercial Use: All the information provided to Us by a User, including personal information or any sensitive personal data or information, is provided voluntary. You understand that We may use certain information provided by You, which may include your personal information or sensitive personal data or information for (i) the purpose of availing any promotional offers in relation to the Services to You; (ii) commercial purposes and in an aggregated and anonymized form for research, statistical analysis and/or business intelligence purposes; (iii) sale or transfer of such research, statistical or intelligence data in an aggregated or non-personally identifiable form to third parties and affiliates; (iv) communication purposes to enhance your experience in relation to the Services; (v) customer support related issues; (vi) and enabling you to complete any transaction through the Electronic Media.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'In addition to the above, We may also use Your personal data for several reasons, including but not limited to; (i) keep You informed of the transaction made on the Electronic Media; (ii) send You communication in relation to availing or providing of the Services via SMS or any other instant messaging service; (iii) allow Our customer service to contact You, if necessary; (iv) customize the content of Our Electronic Media; (v) request You for reviews of the Services; (vi) send You verification message(s) or email(s); (vii) validate/authenticate Your account and to prevent any misuse or abuse; (viii) contact You on Your birthday and/or anniversary to inform You of any special offers; (ix) send You important notices and communications regarding Our services availed or changes to the terms and conditions and/or policies; (x) to administer Our business and Electronic Media; (xi) to send You marketing related communications; (xii) to deal with enquiries and complaints raised by You and to troubleshoot problems; (xiii) ensure compliance with all applicable laws and to ensure safety of the Electronic Media and all Users; (xv) to prevent fraud, errors and/or any illegal activity on the Electronic Media; (xvi) to collect payment from You or make payments to You on behalf of the User availing Services (as the case may be.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "DISCLOSURE OF DATA",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'It may be necessary for Us to disclose Your personal data whether by law, legal process and/or by request from public and/or governmental authorities within or outside of your country of residence. We may also disclose Your personal information if We determine that disclosure is necessary or appropriate for the purposes of law enforcement, national security or to prevent or stop any activity We may consider to be, or to pose a risk of being, illegal, unethical or legally actionable.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Some sections on the Electronic Media are freely accessible by all Users and visitors and require no prior registration. Further, certain sections on the Electronic Media are accessible by Users only after entering their details, username and password. Therefore, We request You to use a safe and secure server to access the Electronic Media to ensure the safety of Your username, password and other information. We do not guarantee the security and/or privacy of any information, which may be available to all Users and visitors of the Electronic Media publicly. Further, the Electronic Media may contain links to other websites. Please note that We do not endorse any links or websites and are not responsible for the privacy practices of such third-party websites.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We automatically receive the URL of the site from which anyone visits. We also receive the Internet Protocol (IP) address of each User’s computer (or the proxy server a User used to access the World Wide Web), User’s computer operating system and type of web browser the User is using, email patterns, as well as the name of User’s ISP. This information is used to analyse overall trends to help Us improve Our Services. The linkage between User’s IP address and User’s personally identifiable information is not shared with or disclosed to third parties. Notwithstanding the above, We may share and/or disclose some of the aggregate findings (not the specific data) in anonymized form (i.e., non-personally identifiable) with advertisers, sponsors, investors, strategic partners, and others in order to help grow Our business.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Note that We maintain a strict no-spam policy and do not rent, sell, disclose or share personal information belonging to You with other people or non-affiliated companies without Your consent, except to provide you the Services which You have requested for or otherwise as specifically provided for in this Policy.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'You agree that in addition to as may be provided in this Policy, We may also disclose Your personal information under the following circumstances:',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Third party service professionals and/or providers: We engage, retain or might, as per requirement and business needs of the Company, employ, engage, contract with third party service professionals/providers to work on behalf of or with Us, under agreements containing confidentiality obligations and in accordance with law, in relation to the services provided by Us on the Electronic Media. These third-party service providers may use Your personal information in assisting Us to communicate with You about Our offers, feedback of Services, assisting in payment facilities, providing customer support, assisting in advertising on the Electronic Media etc. We may employ third party companies and/or individuals to help improve or facilitate our service, to provide the Service on our behalf, to perform platform-related services, including but not limited to: payment processing, maintenance services, fraud detection services, database management, web analytics, monitoring, delivery/logistics and evaluation services. In this event, your information may be shared with such third-party companies and/or individuals;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Compliance with laws and protection of Users: We may release your personal information when the same is required in order to comply with the law, in response to court orders, court summons, judgments, decrees, injunctions, arbitral awards, administrative orders, governmental investigation or orders of any government authority or any other legal process, to establish/exercise Our legal rights or defend against legal claims or in the event We reasonably believe that doing so is legally required or is in your interest to protect Your property or other legal rights or property or rights of others. We may also share your personal information in order to enforce and fully comply with Our terms of service and other Company policies;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Business transfer and mergers: We may transfer Your personal information if the Company, is acquired by or merged with another Company, to the extent permitted by applicable law and/or required under the scheme/arrangement of merger, etc. In such an event We will notify You before Your personal information is transferred/shared with the other entity and hence becomes subject to a different Privacy Policy;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Contracting parties: We transfer/share Your information with Our service professionals or third-party contractors to facilitate the availing/provision of Services by You.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'With Your consent: in addition to the aforementioned circumstances, We may share Your personal information with third parties with Your prior consent and/or at Your request.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "COLLECTION AND USE OF NON-PERSONAL DATA",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Non-personal data is data that can never be used to identify an individual. We may collect information regarding customer activities on Our Electronic Media. This aggregated information shall be used by Us in research, analysis, to improve and monitor Our services and for various promotional schemes. Such nonpersonal data may be shared in aggregated, non-personal form with third party to enhance customer experience, offerings or services. The Electronic Media uses cookies, and while using the Electronic Media You will be prompted to accept all cookies. We may place text files in the browser files of Your computer system. A cookie itself does not contain personal information and it will only enable Us to relate Your use of the Electronic Media and Your behaviour on the Electronic Media to information that You have specifically and knowingly provided. The only personal information that a cookie can contain is the information You supply to the cookie. A cookie can’t read data off Your hard disk or read cookie files created by other websites.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We may place both permanent and temporary cookies. A permanent cookie will remain on your web browser until its expiry date, unless deleted prior to such expiry date. However, most cookies are “session cookies” meaning that they automatically get deleted from your computer system at the end of the session. You can refuse cookies by turning them off in Your browser or alternatively You can also set your browser to warn You before accepting any cookies. Therefore, You are always free to decline Our cookies if Your browser permits, however We use certain cookies to authenticate Users on each page after the User logs on to the Electronic Media or accesses any Services. If you, as a casual visitor, have inadvertently browsed any other page of this Electronic Media prior to reading this Privacy Policy, and you do not agree with the manner in which such information is obtained, collected, processed, stored, used, disclosed or retained, merely quitting this browser application should ordinarily clear all temporary cookies installed by Us. All visitors, however, are encouraged to use the “clear cookies” functionality of their browsers to ensure such clearing / deletion, as We cannot guarantee, predict or provide for the behaviour of the equipment of all the visitors of the Electronic Media. Note that You are not a casual visitor if you have willingly submitted any personal data or information to Us through any means, including email, post or through the registration process on the Electronic Media. All such visitors will be deemed to be, and will be treated as Users for the purposes of this Privacy Policy, and in which case, this Privacy Policy applies in its entirety to such persons.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'The data that cookies collect will be used to process and/or analyse information by third parties to help improve or facilitate Our services, to provide Service on Our behalf, to Electronic Media-related services, including but not limited to; maintenance services; fraud detection services; database management; web analytics; monitoring; and evaluation services. If you have any questions about Our cookie usage, please contact Us at the contact details/information mentioned below.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "YOUR RIGHTS AND HOW TO EXERCISE THEM",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We respect the exercise of the rights You have in relation to the personal data We process or use. You can request access to or a copy of your personal data collected and processed by Us. You may also request the rectification and removal of personal data or the restriction of the processing of Your personal data. Users have the right to unilaterally change their e-mail and contact preferences at any time by logging into their "Account" on the Electronic Media and changing the account settings. You also have the right to data portability. If You have an objection to use of Your data under this Policy, please write to Our privacy team at contact information given below. To prevent misuse, We will ask You to identify yourself.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "NOTE FOR ALL USERS",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We do not control or endorse the content, messages or information placed on the Electronic Media by any user or third party and, therefore, We specifically disclaim any liability with regard to such information and Your interaction/engagement with such users, third party providers and products or services offered by them and You agree that you waive any claims against Us relating to same, and to the extent such waiver may be ineffective, you agree to release any claims against Us relating to the same.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'You are responsible for maintaining the accuracy, truthfulness, correctness and completeness of the information You submit or provide to Us, on the Electronic Media; and shall hold harmless and indemnify Us from and against all claims arising out of or in relation to the wrongful information posted, provided by You to Us, on the Electronic Media. If Your personal information changes, You may correct, delete inaccuracies, or amend information by making the change on Our member information page or by contacting Us on the contact information given below. There may be circumstances where We will not correct, delete or update Your personal data, including; (i) where the personal data is opinion data that is kept solely for evaluative purpose; and (ii) the personal data is in documents related to a prosecution if all proceedings relating to the prosecution have not been completed. If you wish to cancel your account or request that We no longer use your information to provide you Services, you may contact us on the contact information given below.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "SECURITY",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We understand the serious implications of data security and take extensive measures to ensure Your data and information is secured. We take extensive technical and legal measures to safeguard Your personal data. The Electronic Media uses a reliable SSL certificate to ensure Your personal data is not misused in any manner whatsoever. We use SSL encryption when transmitting certain kinds of information, such as financial services information or payment information. An icon resembling a padlock is displayed on the bottom of most browser windows during SSL transactions that involve debit/ credit cards and other forms of payment. In case We ask You for Your debit/credit card number for payment or for verification purposes, the same will be SSL encrypted. The information You provide will be stored securely on Our servers. Once You choose to store or enter Your debit/credit card number, it will not be displayed back to You in its entirety when You retrieve or edit it in the future. Instead of the entire number, You will only see asterisks and either the first four digits or the last four digits of your debit/credit card number. We also work with third party service providers/experts/ trainers/professional, suppliers who provide services on Our behalf or to Us. We enter into agreements with such third-party service providers, experts, trainers, professional and suppliers to ensure complete security and safety of the User information. Such third-party service providers do not have any independent right to the information provided by Us to them.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Our employees and data processors, who have access to, and are associated with the processing of sensitive personal data or information, are obliged to respect the confidentiality of every User’s personal information or sensitive personal data and information. We have put in place procedures and technologies as per good industry practices and in accordance with the applicable laws, to maintain security of all personal data from the point of collection to the point of destruction. Any third-party data processor to which We transfer Personal Data shall have to agree to comply with those procedures and policies, or put in place adequate measures on their own.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No administrator of the Electronic Media will have knowledge of Your password. It is important for You to protect against unauthorized access to Your password, Your computer and Your mobile phone. Ensure You log off from the Electronic Media when finished. We do not undertake any liability for any unauthorized use of Your account and password. If You suspect any unauthorized use of Your account, you must immediately notify Us by sending an email to myprivacy@fitpass.co.in. You shall be liable to indemnify Us due to any loss suffered by Us due to such unauthorized use of Your account and password. Note that We make all User information accessible to Our employees, agents or partners and third parties only on a need-to-know basis, and binds only its employees to strict confidentiality obligations. However, We are not responsible for the confidentiality, security or distribution of Your personal information by Our partners and third parties outside the scope of Our agreement with such partners and third parties.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'In case there is any breach of security, We will make all legally required disclosures concerning the breach and the confidentiality, or integrity of Your unencrypted electronically stored "personal data" to You via email or By posting it on Electronic Media without unreasonable delay, in as far as is consistent with any legitimate needs of law enforcement and any measures required to determine the scope of the breach and to safeguard the integrity of data.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "APPLICABLE LAWS AND REGULATIONS",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We ensure that your data and information shall be protected under the provisions of Information Technology Act, 2000, Information Technology (Intermediaries’ Guidelines) Rules, 2011 and Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011 along with any amendments made to these acts, rules and regulations.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "RETENTION PERIODS",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We do not keep your personal data longer than necessary for the purpose of the processing. This includes, for example, the purposes of satisfying any legal, regulatory, accounting, reporting requirements, to carry out legal work, for the establishment or defence of legal claims. We may aggregate and anonymize your personal data (so that it can no longer be associated with you) for research or statistical purposes, in which case We may use this information indefinitely without further notice to you.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "DATA PROTECTION",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Under certain circumstances, You have rights under applicable data protection laws in relation to Your personal data. It is Our policy to respect Your rights and We will act promptly and in accordance with any applicable law, rule or regulation relating to the processing of Your personal data. Details of Your rights are set out below:',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '     i. Right to be informed about how personal data is used – You have a right to be informed about how We will use and share Your personal data. This explanation will be provided to You in a concise, transparent, intelligible and easily accessible format and will be written in clear and plain language;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '     ii. Right to access personal data – You have a right to obtain confirmation of whether We are processing Your personal data, access to Your personal data and information regarding how Your personal data is being used by Us;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '     iii. Right to have inaccurate personal data rectified – You have a right to have any inaccurate or incomplete personal data rectified. If We have disclosed the relevant personal data to any third parties, We will take reasonable steps to inform those third parties of the rectification where possible;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '     iv. Right to have personal data erased in certain circumstances – You have a right to request that certain personal data held by Us is erased. This is also known as the ‘right to be forgotten’. This is not a blanket right to require all personal data to be deleted. We will consider each request carefully in accordance with the requirements of any laws relating to the processing of your personal data;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '     v. Right to restrict processing of personal data in certain circumstances – You have a right to block the processing of your personal data in certain circumstances. This right arises if You are disputing the accuracy of personal data, if You have raised an objection to processing, if processing of personal data is unlawful and You oppose erasure and request restriction instead or if the personal data is no longer required by Us but You require the personal data to be retained to establish, exercise or defend a legal claim;',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  SizedBox(height: 12),
                  Text(
                    '     vi. Right to data portability – under certain circumstances, You have the right to request to receive a copy of Your personal data in a commonly used electronic format. This right only applies to personal data that You have provided to Us (for example by completing a form or providing information through the Electronic Media). Information about You which has been gathered by monitoring Your behaviour will also be subject to the right to data portability. The right to data portability only applies if the processing is based on Your consent or if the personal data must be processed for the performance of a contract and the processing is carried out by automated means (i.e. electronically);',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "QUESTIONS OR COMPLAINTS",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'If you have any question or complaints about the processing of your personal data, write to us at  myprivacy@fitpass.co.in. Our team will be happy to assist you.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "CONTACT INFORMATION",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Address: FITPASS, 2E/8 Second Floor, Jhandewalan Extension, New Delhi – 10055 , Email: info@fitpass.co.in',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  SizedBox(height: 13),
                  Center(
                    child: Text(
                      "********",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Colors.black),
                    ),
                  ),

                ]),
          ),
        ),
      ),
    );
  }
}
