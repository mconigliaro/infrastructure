#
# To apply changes: sievec .dovecot.sieve .dovecot.sievec
#

require "fileinto";

if header :contains "X-Spam-Flag" "YES" {
  fileinto "Junk";
}
