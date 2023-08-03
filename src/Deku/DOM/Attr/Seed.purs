module Deku.DOM.Attr.Seed where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Seed = Seed

instance Attr FeTurbulence_ Seed (NonEmpty.NonEmpty Event.Event  String ) where
  attr Seed bothValues = unsafeAttribute $ Both (pure 
    { key: "seed", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "seed", value: prop' value })
instance Attr FeTurbulence_ Seed  String  where
  attr Seed value = unsafeAttribute $ This $ pure $
    { key: "seed", value: prop' value }
instance Attr FeTurbulence_ Seed (Event.Event  String ) where
  attr Seed eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "seed", value: prop' value }

instance Attr everything Seed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Seed bothValues = unsafeAttribute $ Both (pure  { key: "seed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "seed", value: unset' })
instance Attr everything Seed  Unit  where
  attr Seed _ = unsafeAttribute $ This $ pure $ { key: "seed", value: unset' }
instance Attr everything Seed (Event.Event  Unit ) where
  attr Seed eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "seed", value: unset' }
