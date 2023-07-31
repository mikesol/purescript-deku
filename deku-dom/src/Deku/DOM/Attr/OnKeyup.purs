module Deku.DOM.Attr.OnKeyup where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnKeyup = OnKeyup

instance Deku.Attribute.Attr everything OnKeyup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keyup", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnKeyup
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyup", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnKeyupEffect =
  forall element
   . Deku.Attribute.Attr element OnKeyup (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnKeyup Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyup", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnKeyup (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyup", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
