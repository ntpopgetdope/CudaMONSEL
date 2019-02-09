#include "String.cuh"

namespace String
{
   __host__ __device__ String::String()
   {
      Copy("");
   }

   __host__ __device__ String::String(char const * s)
   {
      Copy(s);
   }

   __host__ __device__ void String::operator=(String s)
   {
      Copy(s.Get());
   }

   __host__ __device__ bool String::operator==(String a)
   {
      return AreEqual(a, str);
   }

   __host__ __device__ char* String::Get()
   {
      return str;
   }

   __host__ __device__ void String::Copy(char const * s)
   {
      int k;
      for (k = 0; *s != NULL; ++s, ++k) {
         if (k == MAX_LEN - 1) {
            break;
         }
         str[k] = *s;
      }
      str[k] = '\0';
   }

   __host__ __device__ void IToA(char* d, int n, int maxLen)
   {
      if (maxLen < 1) {
         return;
      }
      d[0] = '\0';
      if (maxLen == 1) {
         return;
      }

      int idx = 0;
      do {
         int m = n % 10;
         n /= 10;
         char a = '0' + m;
         d[idx] = a;
         ++idx;
      } while (n != 0);

      for (int k = 0; k < idx / 2; ++k) {
         int lastIdx = (idx - 1) - k;
         char a = d[lastIdx];
         d[lastIdx] = d[k];
         d[k] = a;
      }
      d[idx] = '\0';
   }

   __host__ __device__ bool AreEqual(String a, String b)
   {
      char* aStr = a.Get();
      char* bStr = b.Get();
      int idx = 0;
      while (true) {
         if (aStr[idx] == '\0' && bStr[idx] == '\0') {
            return true;
         }
         if (aStr[idx] == '\0' || bStr[idx] == '\0') {
            return false;
         }
         if (aStr[idx] != bStr[idx]) {
            return false;
         }
         ++idx;
      }
      return true;
   }
}
