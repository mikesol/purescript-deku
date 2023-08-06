module Deku.DOM.Attr.Seed where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
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
instance Attr FeTurbulence_ Seed (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Seed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "seed", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "seed", value: prop' value })
instance Attr FeTurbulence_ Seed  String  where
  attr Seed value = unsafeAttribute $ This $ pure $
    { key: "seed", value: prop' value }
instance Attr FeTurbulence_ Seed (Event.Event  String ) where
  attr Seed eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "seed", value: prop' value }

instance Attr FeTurbulence_ Seed (ST.ST Global.Global  String ) where
  attr Seed iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "seed", value: prop' value }

instance Attr everything Seed (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Seed bothValues = unsafeAttribute $ Both (pure  { key: "seed", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "seed", value: unset' })
instance Attr everything Seed (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Seed (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "seed", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "seed", value: unset' })
instance Attr everything Seed  Unit  where
  attr Seed _ = unsafeAttribute $ This $ { key: "seed", value: unset' }
instance Attr everything Seed (Event.Event  Unit ) where
  attr Seed eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "seed", value: unset' }

instance Attr everything Seed (ST.ST Global.Global  Unit ) where
  attr Seed iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "seed", value: unset' }
