module Deku.DOM.Attr.Href where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Base (Base_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Href = Href

instance Attr A_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr A_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr A_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr A_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr A_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr Area_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Area_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Area_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr Area_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Area_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr Base_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Base_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Base_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr Base_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Base_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr Link_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Link_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Link_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr Link_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Link_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr Image_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Image_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Image_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr Image_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Image_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr LinearGradient_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr LinearGradient_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr LinearGradient_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr LinearGradient_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr LinearGradient_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr Pattern_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Pattern_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Pattern_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr Pattern_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Pattern_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr RadialGradient_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr RadialGradient_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr RadialGradient_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr RadialGradient_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr RadialGradient_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr TextPath_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr TextPath_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr TextPath_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr TextPath_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr TextPath_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr Use_ Href (NonEmpty.NonEmpty Event.Event  String ) where
  attr Href bothValues = unsafeAttribute $ Both (pure 
    { key: "href", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Use_ Href (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "href", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "href", value: prop' value })
instance Attr Use_ Href  String  where
  attr Href value = unsafeAttribute $ This $ pure $
    { key: "href", value: prop' value }
instance Attr Use_ Href (Event.Event  String ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "href", value: prop' value }

instance Attr Use_ Href (ST.ST Global.Global  String ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \value ->
    { key: "href", value: prop' value }

instance Attr everything Href (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Href bothValues = unsafeAttribute $ Both (pure  { key: "href", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "href", value: unset' })
instance Attr everything Href (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Href (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "href", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "href", value: unset' })
instance Attr everything Href  Unit  where
  attr Href _ = unsafeAttribute $ This $ { key: "href", value: unset' }
instance Attr everything Href (Event.Event  Unit ) where
  attr Href eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "href", value: unset' }

instance Attr everything Href (ST.ST Global.Global  Unit ) where
  attr Href iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "href", value: unset' }
