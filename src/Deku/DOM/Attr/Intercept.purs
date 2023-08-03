module Deku.DOM.Attr.Intercept where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intercept = Intercept

instance Attr FeFuncA_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncA_ Intercept (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Intercept (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "intercept", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncA_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncA_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncA_ Intercept (ST.ST Global.Global  String ) where
  attr Intercept stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncB_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncB_ Intercept (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Intercept (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "intercept", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncB_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncB_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncB_ Intercept (ST.ST Global.Global  String ) where
  attr Intercept stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncG_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncG_ Intercept (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Intercept (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "intercept", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncG_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncG_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncG_ Intercept (ST.ST Global.Global  String ) where
  attr Intercept stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncR_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncR_ Intercept (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Intercept (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "intercept", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncR_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncR_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncR_ Intercept (ST.ST Global.Global  String ) where
  attr Intercept stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr everything Intercept (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "intercept", value: unset' })
instance Attr everything Intercept (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Intercept (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "intercept", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "intercept", value: unset' })
instance Attr everything Intercept  Unit  where
  attr Intercept _ = unsafeAttribute $ This $ pure $
    { key: "intercept", value: unset' }
instance Attr everything Intercept (Event.Event  Unit ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "intercept", value: unset' }

instance Attr everything Intercept (ST.ST Global.Global  Unit ) where
  attr Intercept stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "intercept", value: unset' }
