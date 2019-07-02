// file: gov\nist\microanalysis\EPQLibrary\ScreenedRutherfordScatteringAngle.cuh
#ifndef _SCREENED_RUTHERFORD_SCATTERING_ANGLE_CUH_
#define _SCREENED_RUTHERFORD_SCATTERING_ANGLE_CUH_

#include "gov\nist\microanalysis\NISTMonte\Declarations.cuh"
#include "gov\nist\microanalysis\EPQLibrary\RandomizedScatter.cuh"
#include "gov\nist\microanalysis\EPQLibrary\RandomizedScatterFactory.cuh"

namespace ScreenedRutherfordScatteringAngle
{
   class ScreenedRutherfordScatteringAngle : public RandomizedScatterT
   {
   public:
      __host__ __device__ ScreenedRutherfordScatteringAngle(const ElementT& elm);

      StringT toString() const;

      const ElementT& getElement() const override;
      double totalCrossSection(double energy) const override;
      double randomScatteringAngle(double energy) const override;

      __host__ __device__ int get() const;

   private:
      const ElementT& mElement;
   };

   class ScreenedRutherfordRandomizedScatterFactory : public RandomizedScatterFactoryT
   {
   public:
      ScreenedRutherfordRandomizedScatterFactory();

      const RandomizedScatterT& get(const ElementT& elm) const override;

   protected:
      void initializeDefaultStrategy() override;
   };

   extern const RandomizedScatterFactoryT& Factory;

   __host__ __device__ extern const ScreenedRutherfordScatteringAngle& getSRSA(int an);

   extern void init();
   extern __global__ void initCuda();
}

#endif