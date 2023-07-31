module Deku.DOM.Attr.OnWebkitanimationstart where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnWebkitanimationstart = OnWebkitanimationstart

instance Deku.Attribute.Attr everything OnWebkitanimationstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onwebkitanimationstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnWebkitanimationstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnWebkitanimationstartEffect =
  forall element
   . Deku.Attribute.Attr element OnWebkitanimationstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnWebkitanimationstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationstart", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnWebkitanimationstart (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
