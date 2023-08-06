module Deku.DOM.Attr.Target where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Form (Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Target = Target

instance Attr A_ Target (NonEmpty.NonEmpty Event.Event  String ) where
  attr Target bothValues = unsafeAttribute $ Both (pure 
    { key: "target", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr A_ Target (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Target (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "target", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr A_ Target  String  where
  attr Target value = unsafeAttribute $ This $ pure $
    { key: "target", value: prop' value }
instance Attr A_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr A_ Target (ST.ST Global.Global  String ) where
  attr Target iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "target", value: prop' value }

instance Attr Area_ Target (NonEmpty.NonEmpty Event.Event  String ) where
  attr Target bothValues = unsafeAttribute $ Both (pure 
    { key: "target", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr Area_ Target (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Target (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "target", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr Area_ Target  String  where
  attr Target value = unsafeAttribute $ This $ pure $
    { key: "target", value: prop' value }
instance Attr Area_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr Area_ Target (ST.ST Global.Global  String ) where
  attr Target iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "target", value: prop' value }

instance Attr Base_ Target (NonEmpty.NonEmpty Event.Event  String ) where
  attr Target bothValues = unsafeAttribute $ Both (pure 
    { key: "target", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr Base_ Target (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Target (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "target", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr Base_ Target  String  where
  attr Target value = unsafeAttribute $ This $ pure $
    { key: "target", value: prop' value }
instance Attr Base_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr Base_ Target (ST.ST Global.Global  String ) where
  attr Target iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "target", value: prop' value }

instance Attr Form_ Target (NonEmpty.NonEmpty Event.Event  String ) where
  attr Target bothValues = unsafeAttribute $ Both (pure 
    { key: "target", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr Form_ Target (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Target (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "target", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "target", value: prop' value })
instance Attr Form_ Target  String  where
  attr Target value = unsafeAttribute $ This $ pure $
    { key: "target", value: prop' value }
instance Attr Form_ Target (Event.Event  String ) where
  attr Target eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "target", value: prop' value }

instance Attr Form_ Target (ST.ST Global.Global  String ) where
  attr Target iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "target", value: prop' value }

instance Attr everything Target (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Target bothValues = unsafeAttribute $ Both (pure 
    { key: "target", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "target", value: unset' })
instance Attr everything Target (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Target (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "target", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "target", value: unset' })
instance Attr everything Target  Unit  where
  attr Target _ = unsafeAttribute $ This $ { key: "target", value: unset' }
instance Attr everything Target (Event.Event  Unit ) where
  attr Target eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "target", value: unset' }

instance Attr everything Target (ST.ST Global.Global  Unit ) where
  attr Target iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "target", value: unset' }
