--===========================================================================
--
--  This package is the interface to the Matrix Double Word part of the
--  EDC Client
--  As a client of this package, you can chose, if you want to display
--  bytes independently or a word or a double word or a combination of all.
--
--===========================================================================
--
--  Copyright 2021 (C) Holger Rodriguez
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with HAL;

package Edc_Client.Matrix_Double_Word is

   --------------------------------------------------------------------------
   --  Command string for controlling the byte part of the display
   --------------------------------------------------------------------------
   type Byte_String is new String (1 .. 6);

   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for the
   --  Show_LSW/MSW+LSB/MSB procedures
   --------------------------------------------------------------------------
   type Byte_Transmit_Procedure is
     access not null procedure (Control : Byte_String);

   --------------------------------------------------------------------------
   --  Initializes the client and must be called before any other procedure
   --  in this package for any byte related communication
   --------------------------------------------------------------------------
   procedure Byte_Initialize (T : Byte_Transmit_Procedure);

   --------------------------------------------------------------------------
   --  Returns the status if the package has been initialized for byte
   --------------------------------------------------------------------------
   function Byte_Initialized return Boolean;

   --------------------------------------------------------------------------
   --  Command string for controlling the word part of the display
   --------------------------------------------------------------------------
   type Word_String is new String (1 .. 8);

   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for the
   --  Show_LSW/MSW procedures
   --------------------------------------------------------------------------
   type Word_Transmit_Procedure is
     access not null procedure (Control : Word_String);

   --------------------------------------------------------------------------
   --  Initializes the client and must be called before any other procedure
   --  in this package for any word related communication
   --------------------------------------------------------------------------
   procedure Word_Initialize (T : Word_Transmit_Procedure);

   --------------------------------------------------------------------------
   --  Returns the status if the package has been initialized for word
   --------------------------------------------------------------------------
   function Word_Initialized return Boolean;

   --------------------------------------------------------------------------
   --  Command string for controlling the double word of the display
   --------------------------------------------------------------------------
   type Double_Word_String is new String (1 .. 12);

   --------------------------------------------------------------------------
   --  This type defines the callback procedure, which needs to be
   --  provided for the communication to the dashboard for the
   --  Show_LSW/MSW procedures
   --------------------------------------------------------------------------
   type Double_Word_Transmit_Procedure is
     access not null procedure (Control : Double_Word_String);

   --------------------------------------------------------------------------
   --  Initializes the client and must be called before any other procedure
   --  in this package for any double word related communication
   --------------------------------------------------------------------------
   procedure Double_Word_Initialize (T : Double_Word_Transmit_Procedure);

   --------------------------------------------------------------------------
   --  Returns the status if the package has been initialized for double word
   --------------------------------------------------------------------------
   function Double_Word_Initialized return Boolean;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     least significant byte of the least significant word on the matrix
   --     This is equivalent of the most right byte on the matrix
   --------------------------------------------------------------------------
   procedure Show_LSW_LSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     most significant byte of the least significant word on the matrix
   --     This is equivalent of the second right byte on the matrix
   --------------------------------------------------------------------------
   procedure Show_LSW_MSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     least significant byte of the most significant word on the matrix
   --     This is equivalent of the second left byte on the matrix
   --------------------------------------------------------------------------
   procedure Show_MSW_LSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     most significant byte of the most significant word on the matrix
   --     This is equivalent of the most left byte on the matrix
   --------------------------------------------------------------------------
   procedure Show_MSW_MSB (Value : HAL.UInt8)
     with Pre => Byte_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     least significant word on the matrix
   --     This is equivalent of the right word on the matrix
   --------------------------------------------------------------------------
   procedure Show_LSW (Value : HAL.UInt16)
     with Pre => Word_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     most significant word on the matrix
   --     This is equivalent of the left word on the matrix
   --------------------------------------------------------------------------
   procedure Show_MSW (Value : HAL.UInt16)
     with Pre => Word_Initialized;

   --------------------------------------------------------------------------
   --  Shows/Displays the
   --     double word on the matrix
   --     This is equivalent using all bytes on the matrix
   --------------------------------------------------------------------------
   procedure Show_Double_Word (Value : HAL.UInt32)
     with Pre => Double_Word_Initialized;

end Edc_Client.Matrix_Double_Word;
