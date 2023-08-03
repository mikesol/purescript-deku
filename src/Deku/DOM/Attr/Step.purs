module Deku.DOM.Attr.Step where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Step = Step

instance Attr Input_ Step (NonEmpty.NonEmpty Event.Event  String ) where
  attr Step bothValues = unsafeAttribute $ Both (pure 
    { key: "step", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "step", value: prop' value })
instance Attr Input_ Step (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Step (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "step", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "step", value: prop' value })
instance Attr Input_ Step  String  where
  attr Step value = unsafeAttribute $ This $ pure $
    { key: "step", value: prop' value }
instance Attr Input_ Step (Event.Event  String ) where
  attr Step eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "step", value: prop' value }

instance Attr Input_ Step (ST.ST Global.Global  String ) where
  attr Step stValue = unsafeAttribute $ This $ stValue <#> \value ->
    { key: "step", value: prop' value }

instance Attr everything Step (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Step bothValues = unsafeAttribute $ Both (pure  { key: "step", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "step", value: unset' })
instance Attr everything Step (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Step (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->   { key: "step", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "step", value: unset' })
instance Attr everything Step  Unit  where
  attr Step _ = unsafeAttribute $ This $ pure $ { key: "step", value: unset' }
instance Attr everything Step (Event.Event  Unit ) where
  attr Step eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "step", value: unset' }

instance Attr everything Step (ST.ST Global.Global  Unit ) where
  attr Step stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "step", value: unset' }
