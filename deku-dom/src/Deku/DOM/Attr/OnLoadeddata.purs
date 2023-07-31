module Deku.DOM.Attr.OnLoadeddata where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnLoadeddata = OnLoadeddata

instance Deku.Attribute.Attr everything OnLoadeddata Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "loadeddata", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnLoadeddata
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loadeddata", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnLoadeddataEffect =
  forall element
   . Deku.Attribute.Attr element OnLoadeddata (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnLoadeddata Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loadeddata", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnLoadeddata (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "loadeddata", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
