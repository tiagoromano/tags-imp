
package app.entity;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonFilter;
import cronapi.rest.security.CronappSecurity;
import cronapi.swagger.CronappSwagger;


/**
* Classe que representa a tabela TEST
* @generated
*/
@javax.persistence.Entity
@javax.persistence.Table(name = "\"TEST\"")
@XmlRootElement
@CronappSecurity
@JsonFilter("app.entity.Test")
public class Test implements Serializable {
    /**
    * UID da classe, necessário na serialização
    * @generated
    */
    private static final long serialVersionUID = 1L;

    /**
    * @generated
    */
    @Id
    @Column(name = "id", nullable = false, insertable=true, updatable=true)
        private java.lang.String id = UUID.randomUUID().toString().toUpperCase();


    /**
    * @generated
    */
    @Column(name = "name", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String name;


    /**
    * @generated
    */
    @Column(name = "attribute02", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String attribute02;


    /**
    * @generated
    */
    @Column(name = "attribute03", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String attribute03;


    /**
    * @generated
    */
    @Column(name = "attribute04", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String attribute04;


    /**
    * @generated
    */
    @Column(name = "attribute05", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String attribute05;


    /**
    * @generated
    */
    @Column(name = "attribute06", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.String attribute06;


    /**
    * @generated
    */
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "attribute07", nullable = true, unique = false, insertable=true, updatable=true, columnDefinition = "TIMESTAMP")
        
        private java.util.Date attribute07;


    /**
    * @generated
    */
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "attribute08", nullable = true, unique = false, insertable=true, updatable=true, columnDefinition = "TIMESTAMP")
        
        private java.util.Date attribute08;


    /**
    * @generated
    */
    @Column(name = "attribute09", nullable = true, unique = false, insertable=true, updatable=true)
        
        private java.lang.Boolean attribute09;


    /**
    * Construtor
    * @generated
    */
    public Test(){
    }

    /**
    * Obtém id
    * return id
    * @generated
    */
    public java.lang.String getId() {
        return this.id;
    }

    /**
    * Define id
    * @param id id
    * @generated
    */
    public Test setId(java.lang.String id) {
        this.id = id;
        return this;
    }
    /**
    * Obtém name
    * return name
    * @generated
    */
    public java.lang.String getName() {
        return this.name;
    }

    /**
    * Define name
    * @param name name
    * @generated
    */
    public Test setName(java.lang.String name) {
        this.name = name;
        return this;
    }
    /**
    * Obtém attribute02
    * return attribute02
    * @generated
    */
    public java.lang.String getAttribute02() {
        return this.attribute02;
    }

    /**
    * Define attribute02
    * @param attribute02 attribute02
    * @generated
    */
    public Test setAttribute02(java.lang.String attribute02) {
        this.attribute02 = attribute02;
        return this;
    }
    /**
    * Obtém attribute03
    * return attribute03
    * @generated
    */
    public java.lang.String getAttribute03() {
        return this.attribute03;
    }

    /**
    * Define attribute03
    * @param attribute03 attribute03
    * @generated
    */
    public Test setAttribute03(java.lang.String attribute03) {
        this.attribute03 = attribute03;
        return this;
    }
    /**
    * Obtém attribute04
    * return attribute04
    * @generated
    */
    public java.lang.String getAttribute04() {
        return this.attribute04;
    }

    /**
    * Define attribute04
    * @param attribute04 attribute04
    * @generated
    */
    public Test setAttribute04(java.lang.String attribute04) {
        this.attribute04 = attribute04;
        return this;
    }
    /**
    * Obtém attribute05
    * return attribute05
    * @generated
    */
    public java.lang.String getAttribute05() {
        return this.attribute05;
    }

    /**
    * Define attribute05
    * @param attribute05 attribute05
    * @generated
    */
    public Test setAttribute05(java.lang.String attribute05) {
        this.attribute05 = attribute05;
        return this;
    }
    /**
    * Obtém attribute06
    * return attribute06
    * @generated
    */
    public java.lang.String getAttribute06() {
        return this.attribute06;
    }

    /**
    * Define attribute06
    * @param attribute06 attribute06
    * @generated
    */
    public Test setAttribute06(java.lang.String attribute06) {
        this.attribute06 = attribute06;
        return this;
    }
    /**
    * Obtém attribute07
    * return attribute07
    * @generated
    */
    public java.util.Date getAttribute07() {
        return this.attribute07;
    }

    /**
    * Define attribute07
    * @param attribute07 attribute07
    * @generated
    */
    public Test setAttribute07(java.util.Date attribute07) {
        this.attribute07 = attribute07;
        return this;
    }
    /**
    * Obtém attribute08
    * return attribute08
    * @generated
    */
    public java.util.Date getAttribute08() {
        return this.attribute08;
    }

    /**
    * Define attribute08
    * @param attribute08 attribute08
    * @generated
    */
    public Test setAttribute08(java.util.Date attribute08) {
        this.attribute08 = attribute08;
        return this;
    }
    /**
    * Obtém attribute09
    * return attribute09
    * @generated
    */
    public java.lang.Boolean getAttribute09() {
        return this.attribute09;
    }

    /**
    * Define attribute09
    * @param attribute09 attribute09
    * @generated
    */
    public Test setAttribute09(java.lang.Boolean attribute09) {
        this.attribute09 = attribute09;
        return this;
    }

    /**
    * @generated
    */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
Test object = (Test)obj;
        if (id != null ? !id.equals(object.id) : object.id != null) return false;
        return true;
    }

    /**
    * @generated
    */
    @Override
    public int hashCode() {
        int result = 1;
        result = 31 * result + ((id == null) ? 0 : id.hashCode());
        return result;
    }

}