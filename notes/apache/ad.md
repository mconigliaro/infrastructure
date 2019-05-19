    <directory /path/to/top/secret/area>
      AuthName "Top Secret Area"
      AuthType Basic
      AuthBasicProvider ldap
      AuthzLDAPAuthoritative Off
      AuthLDAPURL "ldap://example.com:389/DC=example,DC=com?sAMAccountName?sub?(objectClass=*)" NONE
      AuthLDAPBindDN apacheldapauth@example.com
      AuthLDAPBindPassword mypassword
      Require valid-group cn=Admins,ou=Groups,DC=example.com,DC=com
    </directory>

In this example, I am password-protecting **/path/to/top/secret/area**. The **AuthLDAPURL** directive contains the address of your active directory server (ldap://example.com:389), the base DN to search (DC=example,DC=com), and the LDAP attribute that contains the user's username (sAMAccountName). In order to perform the search, Apache will bind to the Active Directory server using the credentials defined in **AuthLDAPBindDN** and **AuthLDAPBindPassword**. If a user is found and the password matches, one last search is done to make sure they belong to the appropriate group (cn=Admins,ou=Groups,DC=example.com,DC=com).

There's nothing special about this example so far as it relates to Active Directory. The same config should work on any LDAP server. However, the real key to making this work with Active Directory is by adding the following to **/etc/openldap/ldap.conf**:

    REFERRALS off

Note that since the bind password is stored in plain text, make sure your Apache config file file can only be read by authorized users.
