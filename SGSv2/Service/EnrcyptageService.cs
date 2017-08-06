using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;

namespace SGSv2.Service
{
    public class EnrcyptageService
    {
        public String generateRandomPassword(int lenght)
        {
            return generateRandomPasswordAction(lenght);
        }
        public String generateRandomPassword()
        {
            return generateRandomPasswordAction(10);
            
        }

        public String generateRandomPasswordAction(int lenght)
        {
            Random random = new Random();

            int rand = random.Next();
            String pass = "";

            for (int i = 1; i < lenght; i++)
            {
                int charNo = random.Next(1, 62);  // Represents the 26 letters (lower and uppercase) and the 10 digits
                if (charNo <= 10)
                {
                    charNo += 47; // Digits (1-10) : ASCII[48-57]
                }
                else if (charNo <= 36) // Uppercase letters (11-36) : ASCII[65-90]
                {
                    charNo += 54;
                }
                else // Lowercase letters (36-62) : ASCII[97-122]
                {
                    charNo += 60;
                }
                pass += charNo;
            }
            return pass;
        }

        public String getSha1Hash(String text)
        {
            SHA1 hashAlg = SHA1.Create();
            Byte[] hashvalue = hashAlg.ComputeHash(System.Text.Encoding.Default.GetBytes(text));
            String hashstring = "";

            for (int i = 0; i < hashvalue.Length; i++)
            {
                hashstring += hashvalue[i].ToString("x2");
            }

            hashAlg = null;
            hashvalue = null;

            return hashstring;
        }


    }
}