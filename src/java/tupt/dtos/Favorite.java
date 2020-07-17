/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tupt.dtos;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sherl
 */
@XmlRootElement
public class Favorite implements Serializable {
    private int id;
    private Product productID;
    private Registration accountID;

    public Favorite() {
    }

    @XmlElement
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @XmlElement
    public Product getProductID() {
        return productID;
    }

    public void setProductID(Product productID) {
        this.productID = productID;
    }

    @XmlElement
    public Registration getAccountID() {
        return accountID;
    }

    public void setAccountID(Registration accountID) {
        this.accountID = accountID;
    }
    
    
}
