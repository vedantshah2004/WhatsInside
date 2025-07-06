package com.Service;

import org.springframework.stereotype.Service;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class Smsservice {

    // Find your Account SID and Auth Token at https://www.twilio.com/console
    private static final String ACCOUNT_SID = "ACb0eded9232c4a7bdb6b4872eff8980eb";
    private static final String AUTH_TOKEN = "74e0ae667f3b90cf4d185c7407d1d150";

    static {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
    }

    public void sendWelcomeSms(String mobileNo) {
        Message message = Message.creator(
                new PhoneNumber("+91"+mobileNo), // recipient number
                new PhoneNumber("+18382592264"), // your Twilio number
                "Hello! Welcome to Whats Inside.")
            .create();

        System.out.println("SMS sent with SID: " + message.getSid());
    }
}
