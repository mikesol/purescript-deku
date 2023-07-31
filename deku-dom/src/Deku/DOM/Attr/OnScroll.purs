module Deku.DOM.Attr.OnScroll where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnScroll = OnScroll

instance Deku.Attribute.Attr everything OnScroll Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scroll", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnScroll
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scroll", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnScrollEffect =
  forall element
   . Deku.Attribute.Attr element OnScroll (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnScroll Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scroll", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnScroll (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scroll", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
