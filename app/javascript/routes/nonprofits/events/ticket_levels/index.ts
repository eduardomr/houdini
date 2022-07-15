// License: LGPL-3.0-or-later
// this will be generated by some route generator in future but for now, we'll handcode it.
/* eslint-disable @typescript-eslint/member-ordering */
export default {
	nonprofitEventTicketLevels: {
		path: (props: {nonprofitId:string, id:string}):string => {
			return `/nonprofits/${props.nonprofitId}/events/${props.id}/ticket_levels`;
		},

		url: (props: {nonprofitId:string, id:string}):string => {
			return `/nonprofits/${props.nonprofitId}/events/${props.id}/ticket_levels`;
		},
	},
};