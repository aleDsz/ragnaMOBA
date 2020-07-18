module rathena.models;

import hibernated.core;
import std.algorithm;
import std.datetime;

@Entity
@Table("login")
class Login {
  @Id @Generated
  @NotNull
  @Column("account_id")
  int account_id;

  @UniqueKey("name")
  @NotNull
  @Column("userid", 23)
  string username;

  @NotNull
  @Column("user_pass", 32)
  string password;

  @NotNull
  @Column("sex", 1)
  string sex;

  @NotNull
  @Column("email", 39)
  string email;

  @NotNull
  @Column("group_id")
  byte group_id;

  @NotNull
  @Column("state")
  int state;

  @NotNull
  @Column("unban_time")
  int unban_time;

  @NotNull
  @Column("expiration_time")
  int expiration_time;

  @NotNull
  @Column("logincount")
  int logincount;

  @Column("lastlogin")
  DateTime lastlogin;

  @NotNull
  @Column("last_ip", 100)
  string last_ip;

  @Column("birthdate")
  Date birthdate;

  @NotNull
  @Column("character_slots")
  byte character_slots;

  @NotNull
  @Column("pincode", 4)
  string pincode;

  @NotNull
  @Column("pincode_change")
  int pincode_change;

  @NotNull
  @Column("vip_time")
  int vip_time;

  @NotNull
  @Column("old_group")
  byte old_group;

  @UniqueKey("web_auth_token_key")
  @Column("web_auth_token", 17)
  string web_auth_token;

  @NotNull
  @Column("web_auth_token_enabled")
  int web_auth_token_enabled;
}
