module Deku.DOM.Attr.OnSelectstart where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSelectstart = OnSelectstart

instance Attr anything OnSelectstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both (pure 
    { key: "selectstart", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "selectstart", value: cb' value })
instance Attr anything OnSelectstart (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSelectstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selectstart", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "selectstart", value: cb' value })
instance Attr anything OnSelectstart  Cb  where
  attr OnSelectstart value = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: cb' value }
instance Attr anything OnSelectstart (Event.Event  Cb ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' value }

instance Attr anything OnSelectstart (ST.ST Global.Global  Cb ) where
  attr OnSelectstart iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "selectstart", value: cb' value }

instance Attr anything OnSelectstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both (pure 
    { key: "selectstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelectstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSelectstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selectstart", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSelectstart  (Effect Unit)  where
  attr OnSelectstart value = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSelectstart (Event.Event  (Effect Unit) ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectstart (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSelectstart iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "selectstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelectstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both (pure 
    { key: "selectstart", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelectstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSelectstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "selectstart", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "selectstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSelectstart  (Effect Boolean)  where
  attr OnSelectstart value = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: cb' (Cb (const value)) }
instance Attr anything OnSelectstart (Event.Event  (Effect Boolean) ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "selectstart", value: cb' (Cb (const value)) }

instance Attr anything OnSelectstart (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSelectstart iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "selectstart", value: cb' (Cb (const value)) }

instance Attr everything OnSelectstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSelectstart bothValues = unsafeAttribute $ Both (pure 
    { key: "selectstart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "selectstart", value: unset' })
instance Attr everything OnSelectstart (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSelectstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "selectstart", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "selectstart", value: unset' })
instance Attr everything OnSelectstart  Unit  where
  attr OnSelectstart _ = unsafeAttribute $ This $ pure $
    { key: "selectstart", value: unset' }
instance Attr everything OnSelectstart (Event.Event  Unit ) where
  attr OnSelectstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "selectstart", value: unset' }

instance Attr everything OnSelectstart (ST.ST Global.Global  Unit ) where
  attr OnSelectstart iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "selectstart", value: unset' }
