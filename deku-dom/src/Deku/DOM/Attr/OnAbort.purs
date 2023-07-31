module Deku.DOM.Attr.OnAbort where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnAbort = OnAbort

instance Deku.Attribute.Attr everything OnAbort Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "abort", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAbort
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "abort", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnAbortEffect =
  forall element
   . Deku.Attribute.Attr element OnAbort (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAbort Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "abort", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnAbort (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "abort", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
