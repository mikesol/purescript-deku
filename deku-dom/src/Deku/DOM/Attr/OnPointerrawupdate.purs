module Deku.DOM.Attr.OnPointerrawupdate where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointerrawupdate = OnPointerrawupdate

instance Deku.Attribute.Attr everything OnPointerrawupdate Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "pointerrawupdate", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerrawupdate
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerrawupdate", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointerrawupdateEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerrawupdate (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerrawupdate Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerrawupdate", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointerrawupdate (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerrawupdate", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
