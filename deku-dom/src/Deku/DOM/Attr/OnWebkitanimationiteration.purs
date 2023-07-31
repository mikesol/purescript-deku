module Deku.DOM.Attr.OnWebkitanimationiteration where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnWebkitanimationiteration = OnWebkitanimationiteration

instance Deku.Attribute.Attr everything OnWebkitanimationiteration Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onwebkitanimationiteration", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnWebkitanimationiteration
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationiteration", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnWebkitanimationiterationEffect =
  forall element
   . Deku.Attribute.Attr element OnWebkitanimationiteration (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnWebkitanimationiteration Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationiteration", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnWebkitanimationiteration (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwebkitanimationiteration", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
