module Deku.DOM.Attr.OnWebkitanimationend where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnWebkitanimationend = OnWebkitanimationend

instance Deku.Attribute.Attr everything OnWebkitanimationend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onwebkitanimationend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnWebkitanimationend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnWebkitanimationendEffect =
  forall element
   . Deku.Attribute.Attr element OnWebkitanimationend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnWebkitanimationend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationend", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnWebkitanimationend (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
