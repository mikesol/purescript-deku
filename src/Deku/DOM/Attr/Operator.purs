module Deku.DOM.Attr.Operator where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Operator = Operator

instance Attr FeComposite_ Operator (NonEmpty.NonEmpty Event.Event  String ) where
  attr Operator bothValues = unsafeAttribute $ Both (pure 
    { key: "operator", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "operator", value: prop' value })
instance Attr FeComposite_ Operator (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Operator (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "operator", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "operator", value: prop' value })
instance Attr FeComposite_ Operator  String  where
  attr Operator value = unsafeAttribute $ This $ pure $
    { key: "operator", value: prop' value }
instance Attr FeComposite_ Operator (Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "operator", value: prop' value }

instance Attr FeComposite_ Operator (ST.ST Global.Global  String ) where
  attr Operator iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "operator", value: prop' value }

instance Attr FeMorphology_ Operator (NonEmpty.NonEmpty Event.Event  String ) where
  attr Operator bothValues = unsafeAttribute $ Both (pure 
    { key: "operator", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "operator", value: prop' value })
instance Attr FeMorphology_ Operator (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Operator (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "operator", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "operator", value: prop' value })
instance Attr FeMorphology_ Operator  String  where
  attr Operator value = unsafeAttribute $ This $ pure $
    { key: "operator", value: prop' value }
instance Attr FeMorphology_ Operator (Event.Event  String ) where
  attr Operator eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "operator", value: prop' value }

instance Attr FeMorphology_ Operator (ST.ST Global.Global  String ) where
  attr Operator iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "operator", value: prop' value }

instance Attr everything Operator (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Operator bothValues = unsafeAttribute $ Both (pure 
    { key: "operator", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "operator", value: unset' })
instance Attr everything Operator (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Operator (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "operator", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "operator", value: unset' })
instance Attr everything Operator  Unit  where
  attr Operator _ = unsafeAttribute $ This $ pure $
    { key: "operator", value: unset' }
instance Attr everything Operator (Event.Event  Unit ) where
  attr Operator eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "operator", value: unset' }

instance Attr everything Operator (ST.ST Global.Global  Unit ) where
  attr Operator iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "operator", value: unset' }
