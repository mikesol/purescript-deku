module Deku.DOM.Attr.OnFormdata where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnFormdata = OnFormdata

instance Deku.Attribute.Attr everything OnFormdata Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onformdata", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnFormdata
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onformdata", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnFormdataEffect =
  forall element
   . Deku.Attribute.Attr element OnFormdata (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnFormdata Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onformdata", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnFormdata (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onformdata", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const