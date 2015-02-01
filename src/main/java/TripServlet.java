


import com.google.appengine.api.datastore.Entity;

import com.google.appengine.api.datastore.*;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;


/**
 * Created by compsci on 1/31/15.
 */
public class TripServlet extends HttpServlet {

    private static DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp){
        double currentTime = System.currentTimeMillis();
        UserService userService = UserServiceFactory.getUserService(); // Finds the user's email from OAuth
        User user = userService.getCurrentUser();
        String email = user.getEmail();
        Entity trip = new Entity("trip", Double.toString(currentTime)); // Trips are Id'd by their timeStamp
        trip.setProperty("user", email);

        trip.setProperty("lastOrder", req.getParameter("")); // Estimated time of delivery, use LUKES
        trip.setProperty("restaurant", req.getParameter(""));
        trip.setProperty("percentageFee", req.getParameter(""));
        trip.setProperty("maxOrder", req.getParameter(""));
        findFee(trip, req);
        trip.setProperty("eta",getMilliTime(req,"eta"));
        trip.setProperty("lastOrder",getMilliTime(req,"lastOrder"));
        
        try {
            resp.sendRedirect("/trip_manager.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    private void findFee(Entity trip, HttpServletRequest req){
        if(req.getParameter("flat")==null){
           trip.setProperty("flatFee",0);
        }
        else{
            trip.setProperty("flatFee",req.getParameter("flatFee"));
        }
        if(req.getParameter("percentage")==null){
            trip.setProperty("percentFee",0);
        }
        else{
            trip.setProperty("percentFee",req.getParameter("percentFee"));
        }
    }
    private long getMilliTime(HttpServletRequest req, String property){
        String dateTerm = property +"Date";
        System.out.println("Printing date"+req.getParameter(dateTerm));
        String[] splitDate = req.getParameter(dateTerm).split("-");
        int[] timeElements = new int[5];
        for(int i =0;i<3;i++){
            timeElements[i] = Integer.parseInt(splitDate[i]);
        }
        String timeTerm = property + "Time";
        String[] splitTime = req.getParameter(timeTerm).split(":");
        timeElements[3]=Integer.parseInt(splitTime[0]);
        timeElements[4]=Integer.parseInt(splitTime[1]);
        /*

        for(int j:timeElements){
            System.out.println(j);
        }
        */

        return new DateToMilliseconds().dateToTime(timeElements);
    }

}

